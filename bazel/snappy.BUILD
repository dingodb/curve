cc_import(
    name = "snappy_import",
    static_library = "lib/libsnappy.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "snappy",
    visibility = ["//visibility:public"],
    deps = [
        ":snappy_import",
        "@third-party-headers//:headers",
    ],
)