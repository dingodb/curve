#
#  Copyright (c) 2020 NetEase Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

load("//:copts.bzl", "CURVE_TEST_COPTS")

cc_library(
    name = "client_integration_common_lib",
    srcs = glob([
        "*.h",
        "*.cpp"],
    ),
    copts = CURVE_TEST_COPTS,
    defines = ["FIU_ENABLE"],
    visibility = ["//visibility:public"],
    deps = [
        "//include/client:include_client",
        "//src/client:curve_client",
        "//src/common:curve_common",
        "//src/common/concurrent:curve_concurrent",
        "@braft//:braft",
        "@brpc//:brpc",
        "@gflags//:gflags",
        "@glog//:glog",
        "@leveldb//:leveldb",
        "@protobuf//:protobuf",
        "@gtest//:gtest",
        "@libfiu//:libfiu",
    ],
)
