cc_import(
    name = "uuid_import",
    static_library = "lib/libuuid_static.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "uuid",
    visibility = ["//visibility:public"],
    deps = [
        "@third-party-headers//:headers",
        ":uuid_import",
    ],
)
