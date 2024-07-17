cc_import(
    name = "curl_import",
    static_library = "lib/libcurl.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "curl",
    visibility = ["//visibility:public"],
    deps = [
        "@third-party-headers//:headers",
        ":curl_import",
        "@zlib//:zlib",
        "@openssl//:openssl",
    ],
)
