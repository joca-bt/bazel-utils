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
