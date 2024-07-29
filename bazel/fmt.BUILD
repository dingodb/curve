cc_import(
    name = "fmt_import",
    static_library = "lib/libfmt.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "fmt",
    visibility = ["//visibility:public"],
    deps = [
        ":fmt_import",
        "@third-party-headers//:headers",
    ],
)
