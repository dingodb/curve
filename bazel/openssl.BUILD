cc_import(
    name = "openssl_import",
    static_library = "lib/libssl.a",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "crypto_import",
    static_library = "lib/libcrypto.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "openssl",
    visibility = ["//visibility:public"],
    deps = [
        ":openssl_import",
        ":crypto_import",
        "@third-party-headers//:headers",
    ],
    linkopts = ['-ldl', "-pthread"]
)