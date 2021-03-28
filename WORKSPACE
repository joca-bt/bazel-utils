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

workspace(name = "extra_bazel_tools")

load("//:repositories.bzl", "io_bazel_stardoc")
io_bazel_stardoc()

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()

load("//:repositories.bzl", "rules_jvm_external")
rules_jvm_external()

load("//tests:maven.bzl", "install_maven_artifacts")
install_maven_artifacts()
