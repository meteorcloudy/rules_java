load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_java//toolchain/jdk:local_java_repository.bzl", "local_java_repository")

local_java_toolchain = module_rule(
  implementation = _local_java_toolchain_impl,
  members = {
    "setup": module_rule_member(),  # No attrs
  },
)

def _local_java_toolchain_impl(ctx):
  local_java_repository(
    name = "local_jdk",
    java_home = ctx.java.default_system_javabase,
    build_file = "@rules_java//toolchain/jdk:jdk.BUILD",
  )

