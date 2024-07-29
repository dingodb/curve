cc_import(
    name = "rocksdb_import",
    static_library = "lib/librocksdb.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "rocksdb",
    visibility = ["//visibility:public"],
    deps = [
        ":rocksdb_import",
        "@third-party-headers//:headers",
	"@snappy//:snappy",
	"@zlib//:zlib",
	"@gflags//:gflags",
    ],
)
