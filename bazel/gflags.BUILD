cc_import(
    name = "gflags_import",
    static_library = "lib/libgflags.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "gflags",
    visibility = ["//visibility:public"],
    deps = [
        ":gflags_import",
        "@third-party-headers//:headers",
    ],
)
