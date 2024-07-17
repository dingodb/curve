cc_import(
    name = "protobuf_import",
    static_library = "lib/libprotobuf.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "protobuf_lite_import",
    static_library = "lib/libprotobuf-lite.a",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "protoc_import",
    static_library = "lib/libprotoc.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "protobuf",
    visibility = ["//visibility:public"],
    deps = [
        ":protoc_import",
        ":protobuf_import",
        ":protobuf_lite_import",
        "@third-party-headers//:headers",
        "@zlib//:zlib",
        "@jsoncpp//:jsoncpp",
    ],
)