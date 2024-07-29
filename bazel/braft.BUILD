
cc_import(
    name = "braft_import",
    static_library = "lib/libbraft.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "braft",
    visibility = ["//visibility:public"],
    deps = [
        ":braft_import",
        "@third-party-headers//:headers",
        "@brpc//:brpc",
    ],
)
