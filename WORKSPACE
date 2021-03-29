workspace(name = "extra_bazel_tools")

load("//:repositories.bzl", "io_bazel_stardoc")
io_bazel_stardoc()

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()

load("//:repositories.bzl", "rules_jvm_external")
rules_jvm_external()

load("//tests:maven.bzl", "install_maven_artifacts")
install_maven_artifacts()
