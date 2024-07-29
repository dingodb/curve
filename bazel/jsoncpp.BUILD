cc_import(
    name = "jsoncpp_import",
    static_library = "lib/libjsoncpp.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "jsoncpp",
    visibility = ["//visibility:public"],
    deps = [
        ":jsoncpp_import",
        "@third-party-headers//:headers",
    ],
)