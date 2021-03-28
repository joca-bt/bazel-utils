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

load("@rules_java//java:defs.bzl", "java_binary", "java_library")
load("//java:defs.bzl", "javadoc")
load("//spring_boot:defs.bzl", "spring_boot_binary")

java_library(
    name = "lib",
    srcs = glob(["src/main/java/**/*.java"]),
    deps = [
        "@maven//:org_springframework_boot_spring_boot",
        "@maven//:org_springframework_boot_spring_boot_autoconfigure",
        "@maven//:org_springframework_spring_web",
    ],
)

java_binary(
    name = "app",
    main_class = "org.bazeltools.MainApplication",
    runtime_deps = [
        ":lib",
        "@maven//:org_springframework_boot_spring_boot_starter_web",
    ],
)

javadoc(
    name = "doc",
    libs = [
        ":lib",
    ],
    packages = [
        "org.bazeltools",
    ],
)

spring_boot_binary(
    name = "bin",
    libs = [
        ":lib",
    ],
    main_class = "org.bazeltools.MainApplication",
    runtime_deps = [
        "@maven//:org_springframework_boot_spring_boot_starter_web",
    ],
)
