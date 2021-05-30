load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

_SPRING_BOOT = "2.5.0"
_SPRING_FRAMEWORK = "5.3.7"

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
