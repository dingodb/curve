cc_import(
    name = "leveldb_import",
    static_library = "lib/libleveldb.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "leveldb",
    visibility = ["//visibility:public"],
    deps = [
        ":leveldb_import",
        "@third-party-headers//:headers",
        "@snappy//:snappy",
    ],
)