#!/usr/bin/env python3

import click
import re
import requests
import urllib.parse
import xmltodict
from halo import Halo


_MAVEN_REPOSITORY = "https://repo.maven.apache.org/maven2/"


class Artifact:

    def __init__(self, group_id, artifact_id, version, exclusions=None):
        self.artifact_id = artifact_id
        self.bzl = "{}.bzl".format(artifact_id)
        self.exclusions = exclusions
        self.group_id = group_id
        self.name = "{}:{}:{}".format(group_id, artifact_id, version)
        self.pom = "{}-{}.pom".format(artifact_id, version)
        self.url = "{0}/{1}/{2}/{1}-{2}.pom".format(group_id.replace(".", "/"), artifact_id, version)
        self.version = version

    def __lt__(self, other):
        if self.group_id == other.group_id:
            return self.artifact_id < other.artifact_id
        else:
            return self.group_id < other.group_id


def fetch_pom(artifact):
    url = urllib.parse.urljoin(_MAVEN_REPOSITORY, artifact.url)

    with requests.get(url) as r:
        r.raise_for_status()

        with open(artifact.pom, "w") as f:
            f.write(r.text)


def generate_bzl(artifact, dependencies):
    text = "# This file was automatically generated from {}. #".format(artifact.pom)
    padding = "#" * len(text)
    header = "{1}\n{0}\n{1}\n".format(text, padding)

    with open(artifact.bzl, "w") as f:
        f.write(
            "{}"
            "\n"
            'load("@rules_jvm_external//:specs.bzl", "maven")\n'
            "\n"
            "{} = [\n"
            .format(
                header,
                artifact.artifact_id.upper().replace("-", "_")
            )
        )

        for dependency in sorted(dependencies):
            f.write('    maven.artifact("{}", "{}", "{}"'.format(dependency.group_id, dependency.artifact_id, dependency.version))

            if dependency.exclusions:
                f.write(", exclusions = [\n")

                for exclusion in sorted(dependency.exclusions):
                    f.write('        maven.exclusion("{}", "{}"),\n'.format(exclusion.group_id, exclusion.artifact_id))

                f.write("    ]")

            f.write("),\n")

        f.write("]\n")


def listify(obj):
    return [obj] if not isinstance(obj, list) else obj


def parse_pom(artifact):
    with open(artifact.pom) as f:
        return xmltodict.parse(f.read(), xml_attribs=False)


def process_pom(xml):
    def dereference(value, properties):
        match = re.fullmatch(r"\${(.+)}", value)
        return properties[match.group(1)] if match else value

    properties = {}
    poms = []
    jars = []

    if "version" in xml["project"]:
        properties["project.version"] = xml["project"]["version"]
    else:
        properties["project.version"] = xml["project"]["parent"]["version"]

    if "properties" in xml["project"]:
        for name, value in xml["project"]["properties"].items():
            properties[name] = dereference(value, properties)

    for dependency in listify(xml["project"]["dependencyManagement"]["dependencies"]["dependency"]):
        group_id = dependency["groupId"]
        artifact_id = dependency["artifactId"]
        version = dereference(dependency["version"], properties)

        if "type" in dependency:
            poms.append(Artifact(group_id, artifact_id, version))
        else:
            if "exclusions" in dependency:
                exclusions = [Artifact(exclusion["groupId"], exclusion["artifactId"], None) for exclusion in listify(dependency["exclusions"]["exclusion"])]
            else:
                exclusions = None

            jars.append(Artifact(group_id, artifact_id, version, exclusions=exclusions))

    return poms, jars


@click.command()
@click.argument("group_id", type=str)
@click.argument("artifact_id", type=str)
@click.argument("version", type=str)
def main(group_id, artifact_id, version):
    """Convert Maven BOMs into Bazel extensions."""
    artifact = Artifact(group_id, artifact_id, version)

    with Halo(text="Processing {}".format(artifact.name)) as spinner:
        fetch_pom(artifact)
        xml = parse_pom(artifact)
        poms, jars = process_pom(xml)
        generate_bzl(artifact, jars)
        spinner.succeed()

    if poms:
        print("{} depends on the following BOMs:".format(artifact.artifact_id))

        for pom in sorted(poms):
            print("  {}".format(pom.name))


if __name__ == "__main__":
    main()
