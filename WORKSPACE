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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

IO_BAZEL_STARDOC_TAG = "0.4.0"
IO_BAZEL_STARDOC_SHA = "36b8d6c2260068b9ff82faea2f7add164bf3436eac9ba3ec14809f335346d66a"

http_archive(
    name = "io_bazel_stardoc",
    sha256 = IO_BAZEL_STARDOC_SHA,
    strip_prefix = "stardoc-%s" % IO_BAZEL_STARDOC_TAG,
    url = "https://github.com/bazelbuild/stardoc/archive/%s.zip" % IO_BAZEL_STARDOC_TAG,
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()
