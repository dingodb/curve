cc_import(
    name = "libfiu_import",
    static_library = "lib/libfiu.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "libfiu",
    visibility = ["//visibility:public"],
    deps = [
        ":libfiu_import",
        "@third-party-headers//:headers",
    ],
    linkopts = ['-ldl', "-pthread"]
)