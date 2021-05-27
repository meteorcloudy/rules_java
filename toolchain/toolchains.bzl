load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_java//toolchain/jdk:local_java_repository.bzl", "local_java_repository")

def local_jdk(java_home):
    maybe(
        local_java_repository,
        name = "local_jdk",
        java_home = java_home,
        build_file = "@rules_java//toolchain/jdk:jdk.BUILD",
    )

def register_java_toolchains():
    native.register_toolchains("@rules_java//toolchain")
    native.register_toolchains("@rules_java//toolchain/jdk:all")

