cc_import(
    name = "memcache_import",
    static_library = "lib/libmemcached.a",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "hashkit_import",
    static_library = "lib/libhashkit.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "memcache",
    visibility = ["//visibility:public"],
    deps = [
        ":memcache_import",
        ":hashkit_import",
        "@third-party-headers//:headers",
    ],
)