workspace(name = "extra_rules_java")

# Import Skylib rules.

load("//:repositories.bzl", "bazel_skylib")
bazel_skylib()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# Import Stardoc rules.

load("//:repositories.bzl", "io_bazel_stardoc")
io_bazel_stardoc()

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()
