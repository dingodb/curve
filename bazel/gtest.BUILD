cc_import(
    name = "gtest_import",
    static_library = "lib/libgtest.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "gtest_main_import",
    static_library = "lib/libgtest_main.a",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "gmock_import",
    static_library = "lib/libgmock.a",
    visibility = ["//visibility:private"], 
)

cc_import(
    name = "gmock_main_import",
    static_library = "lib/libgmock_main.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "gtest",
    visibility = ["//visibility:public"],
    deps = [
        "@third-party-headers//:headers",
        ":gtest_import",
        ":gtest_main_import", 
        ":gmock_import",
        ":gmock_main_import",
    ],
    linkopts = ["-pthread"]
)