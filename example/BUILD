load("@extra_rules_java//java:defs.bzl", "javadoc")
load("@extra_rules_java//spring_boot:defs.bzl", "spring_boot_binary")
load("@rules_java//java:defs.bzl", "java_binary", "java_library")

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
    name = "jbin",
    main_class = "org.example.MainApplication",
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
        "org.example",
    ],
)

spring_boot_binary(
    name = "sbin",
    libs = [
        ":lib",
    ],
    main_class = "org.example.MainApplication",
    runtime_deps = [
        "@maven//:org_springframework_boot_spring_boot_starter_web",
    ],
)
