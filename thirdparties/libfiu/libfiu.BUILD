# Description:
#  libfiu

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "libfiu",
    srcs = glob([
        "libfiu/libfiu.so",
        "libfiu/libfiu.so.0",
        "libfiu/libfiu.so.1.2",
    ]),
    hdrs = glob([
        "libfiu/*.h",
    ]),
    includes = [
        "libfiu/",
    ],
)
