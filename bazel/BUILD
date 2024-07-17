package(default_visibility = ["//visibility:public"])

# https://github.com/protocolbuffers/protobuf/blob/b4b0e304be5a68de3d0ee1af9b286f958750f5e4/BUILD#L773
proto_lang_toolchain(
    name = "cc_toolchain",
    command_line = "--cpp_out=$(OUT)",
    runtime = "@proto_compiler//:protoc",
    visibility = ["//visibility:public"],
)