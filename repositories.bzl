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

# https://github.com/bazelbuild/stardoc/
def io_bazel_stardoc():
    tag = "0.4.0"
    sha = "36b8d6c2260068b9ff82faea2f7add164bf3436eac9ba3ec14809f335346d66a"

    maybe(
        http_archive,
        name = "io_bazel_stardoc",
        sha256 = sha,
        strip_prefix = "stardoc-{}".format(tag),
        url = "https://github.com/bazelbuild/stardoc/archive/{}.zip".format(tag),
    )

# https://github.com/bazelbuild/rules_jvm_external/
def rules_jvm_external():
    tag = "4.0"
    sha = "31701ad93dbfe544d597dbe62c9a1fdd76d81d8a9150c2bf1ecf928ecdf97169"

    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = sha,
        strip_prefix = "rules_jvm_external-{}".format(tag),
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(tag),
    )
