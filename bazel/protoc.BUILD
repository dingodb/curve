

cc_binary(
    name = "protoc",
    srcs = ["@proto_compiler//:main.cc"],
    linkopts = ["-lpthread"],
    visibility = ["//visibility:public"],
    deps = [
        "@third-party-headers//:headers",
        "@protobuf//:protobuf", 
        "@zlib//:zlib"
    ],
)
