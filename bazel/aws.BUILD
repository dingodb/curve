cc_import(
    name = "aws-cpp-sdk-s3",
    static_library = "lib/libaws-cpp-sdk-s3.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-cpp-sdk-core",
    static_library = "lib/libaws-cpp-sdk-core.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-crt-cpp",
    static_library = "lib/libaws-crt-cpp.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-mqtt",
    static_library = "lib/libaws-c-mqtt.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-event-stream",
    static_library = "lib/libaws-c-event-stream.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-s3",
    static_library = "lib/libaws-c-s3.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-auth",
    static_library = "lib/libaws-c-auth.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-http",
    static_library = "lib/libaws-c-http.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-io",
    static_library = "lib/libaws-c-io.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "s2n",
    static_library = "lib/libs2n.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-compression",
    static_library = "lib/libaws-c-compression.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-cal",
    static_library = "lib/libaws-c-cal.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-sdkutils",
    static_library = "lib/libaws-c-sdkutils.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-checksums",
    static_library = "lib/libaws-checksums.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "aws-c-common",
    static_library = "lib/libaws-c-common.a",
    visibility = ["//visibility:private"], 
)

cc_library(
    name = "aws",
    visibility = ["//visibility:public"],
    deps=[
        ":aws-cpp-sdk-s3",
        ":aws-cpp-sdk-core",
        ":aws-crt-cpp",
        ":aws-c-mqtt",
        ":aws-c-event-stream",
        ":aws-c-s3",
        ":aws-c-auth",
        ":aws-c-http",
        ":aws-c-io",
        ":s2n",
        ":aws-c-compression",
        ":aws-c-cal",
        ":aws-c-sdkutils",
        ":aws-checksums",
        ":aws-c-common",
        "@third-party-headers//:headers",
        "@curl//:curl",
        "@openssl//:openssl",
        "@zlib//:zlib",
    ],
)