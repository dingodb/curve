cc_import(
    name = "spdlog_import",
    static_library = "lib/libspdlog.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "spdlog",
    visibility = ["//visibility:public"],
    deps = [
        ":spdlog_import",
        "@third-party-headers//:headers",
        "@fmt//:fmt",
    ],
)