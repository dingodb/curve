cc_import(
    name = "glog_import",
    static_library = "lib/libglog.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "glog",
    visibility = ["//visibility:public"],
    deps = [
        ":glog_import",
        "@third-party-headers//:headers",
        "@gflags//:gflags"
    ],
)
