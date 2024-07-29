load("//:copts.bzl", "CURVE_TEST_COPTS")

cc_library(
    name = "curve_tool_mock",
    srcs = glob([
                "*.h",
                "*.cpp",
                ]),
    visibility = ["//visibility:public"],
    deps = [
        "//src/tools:curve_tool_lib",
        "@gflags//:gflags",
        "@gtest//:gtest",
    ],
    copts = CURVE_TEST_COPTS,
)

