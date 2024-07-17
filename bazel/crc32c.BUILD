cc_import(
    name = "crc32c_import",
    static_library = "lib/libcrc32c.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "crc32c",
    visibility = ["//visibility:public"],
    deps = [
        ":crc32c_import",
        "@third-party-headers//:headers",
    ],
)

