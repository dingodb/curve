cc_import(
    name = "brpc_import",
    static_library = "lib/libbrpc.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "brpc",
    visibility = ["//visibility:public"],
    deps = [
        "@third-party-headers//:headers",
        ":brpc_import",
        "@zlib//:zlib",
        "@snappy//:snappy",
        "@protobuf//:protobuf",
        "@leveldb//:leveldb",
        "@gflags//:gflags",
        "@glog//:glog",
        "@openssl//:openssl",
    ],
)
