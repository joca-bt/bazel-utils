# Copyright 2021 João Guerra
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

_SPRING_BOOT = "2.4.4"
_SPRING_FRAMEWORK = "5.3.5"

def install_maven_artifacts():
    maven_install(
        artifacts = [
            maven.artifact("org.springframework", "spring-web", _SPRING_FRAMEWORK),
            maven.artifact("org.springframework.boot", "spring-boot", _SPRING_BOOT),
            maven.artifact("org.springframework.boot", "spring-boot-autoconfigure", _SPRING_BOOT),
            maven.artifact("org.springframework.boot", "spring-boot-jarmode-layertools", _SPRING_BOOT),
            maven.artifact("org.springframework.boot", "spring-boot-loader", _SPRING_BOOT),
            maven.artifact("org.springframework.boot", "spring-boot-starter-web", _SPRING_BOOT),
        ],
        repositories = [
            "https://repo.maven.apache.org/maven2/",
        ],
        fail_on_missing_checksum = False,
    )
