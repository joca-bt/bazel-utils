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

# Import Maven rules.

load("//:repositories.bzl", "rules_jvm_external")
rules_jvm_external()

load("//tests:maven.bzl", "install_maven_artifacts")
install_maven_artifacts()
