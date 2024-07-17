cc_import(
    name = "zlib_import",
    static_library = "lib/libz.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "zlib",
    visibility = ["//visibility:public"],
    deps = [
        ":zlib_import",
        "@third-party-headers//:headers",
    ],
)
