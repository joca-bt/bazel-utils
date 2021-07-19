# Additional Java rules for [Bazel](https://bazel.build/)

Rules:
- [javadoc](#javadoc)
- [spring_boot_binary](#spring_boot_binary)

## Usage

```bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

EXTRA_RULES_JAVA_TAG = <tag>
EXTRA_RULES_JAVA_SHA = <sha>

http_archive(
    name = "extra_rules_java",
    sha256 = EXTRA_RULES_JAVA_SHA,
    strip_prefix = "extra_rules_java-{}".format(EXTRA_RULES_JAVA_TAG),
    url = "https://github.com/joca-bt/extra_rules_java/archive/{}.zip".format(EXTRA_RULES_JAVA_TAG),
)
```

Rule [spring_boot_binary](#spring_boot_binary) requires [bazel_skylib](https://github.com/bazelbuild/bazel-skylib/) and [rules_java_external](https://github.com/bazelbuild/rules_jvm_external/).
Additionally, include `org.springframework.boot:spring-boot-jarmode-layertools` and `org.springframework.boot:spring-boot-loader` in your Maven artifacts.

See [example/](example/) for an example.

## Rules

### javadoc

<pre>
javadoc(name, libs, links, packages, title)
</pre>

Generate the Javadoc for a set of [libraries](https://docs.bazel.build/be/java.html#java_library).

**ATTRIBUTES**

| Name     | Description                    | Type                                                                        | Mandatory | Default                                                 |
| ---      | ---                            | ---                                                                         | ---       | ---                                                     |
| name     | A unique name for this target. | <a href="https://docs.bazel.build/build-ref.html#name">Name</a>             | required  |                                                         |
| libs     |                                | <a href="https://docs.bazel.build/build-ref.html#labels">List of labels</a> | required  |                                                         |
| links    |                                | List of strings                                                             | optional  | ["https://docs.oracle.com/en/java/javase/11/docs/api/"] |
| packages |                                | List of strings                                                             | required  |                                                         |
| title    |                                | String                                                                      | optional  | ""                                                      |

### spring_boot_binary

<pre>
spring_boot_binary(name, libs, main_class, runtime_deps)
</pre>

Create an [executable jar](https://docs.spring.io/spring-boot/docs/current/reference/html/executable-jar.html) for a set of [libraries](https://docs.bazel.build/be/java.html#java_library).

This rule requires [bazel_skylib](https://github.com/bazelbuild/bazel-skylib/) and [rules_java_external](https://github.com/bazelbuild/rules_jvm_external/).
See [Usage](#usage) for more details.

**ATTRIBUTES**

| Name         | Description                    | Type                                                                        | Mandatory | Default |
| ---          | ---                            | ---                                                                         | ---       | ---     |
| name         | A unique name for this target. | <a href="https://docs.bazel.build/build-ref.html#name">Name</a>             | required  |         |
| libs         | -                              | <a href="https://docs.bazel.build/build-ref.html#labels">List of labels</a> | required  |         |
| main_class   | -                              | String                                                                      | required  |         |
| runtime_deps | -                              | <a href="https://docs.bazel.build/build-ref.html#labels">List of labels</a> | optional  | []      |
