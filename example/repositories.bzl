load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# https://github.com/bazelbuild/bazel-skylib/
def bazel_skylib():
    tag = "1.0.3"
    sha = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c"

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = sha,
        url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{0}/bazel-skylib-{0}.tar.gz".format(tag),
    )

# https://github.com/joca-bt/extra_rules_java/
def extra_rules_java():
    maybe(
        native.local_repository,
        name = "extra_rules_java",
        path = "../",
    )

# https://github.com/bazelbuild/rules_jvm_external/
def rules_jvm_external():
    tag = "4.1"
    sha = "f36441aa876c4f6427bfb2d1f2d723b48e9d930b62662bf723ddfb8fc80f0140"

    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = sha,
        strip_prefix = "rules_jvm_external-{}".format(tag),
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(tag),
    )
