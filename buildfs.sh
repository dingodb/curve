#!/bin/bash -v

# Copyright (c) 2023 dingodb.com, Inc. All Rights Reserved
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -x

g_root="${PWD}"

echo "Please make sure you have executed build_thirdparties.sh, and the thirdparties have been built successfully."
echo "Only one time is enough, unless you want to rebuild the thirdparties."

if [[ ! -v BAZEL_JOBS ]]; then
    echo "BAZEL_JOBS is not set, use default value 16"
    BAZEL_JOBS=16
elif [[ -z "$BAZEL_JOBS" ]]; then
    echo "BAZEL_JOBS is set to the empty string, use default value 16"
    BAZEL_JOBS=16
else
    echo "BAZEL_JOBS has the value: $BAZEL_JOBS"
fi

# cpplint --recursive curvefs
# if [ $? -ne 0 ]
# then
#     echo "cpplint failed"
#     exit
# fi

if [ `gcc -dumpversion | awk -F'.' '{print $1}'` -le 6 ]
then
    bazelflags="--jobs=${BAZEL_JOBS}"
else
    bazelflags="--copt -faligned-new --jobs=${BAZEL_JOBS}"
fi

if [ "$1" = "debug" ]
then
    DEBUG_FLAG="--compilation_mode=dbg"
fi

bazel build curvefs/... --copt -DHAVE_ZLIB=1 ${DEBUG_FLAG} -s \
--define=with_glog=true --define=libunwind=true --copt -DGFLAGS_NS=google --copt -Wno-error=format-security  \
--copt -DUSE_BTHREAD_MUTEX --copt -DCURVEVERSION=${curve_version}  \
--copt -DCLIENT_CONF_PATH="\"${g_root}/curvefs/conf/client.conf\"" \
${bazelflags}

if [ $? -ne 0 ]
then
    echo "build curvefs failed"
    exit
fi

echo "build curvefs success"

if [ "$1" = "test" ]
then
    ./bazel-bin/curvefs/test/metaserver/curvefs_metaserver_test

    if [ $? -ne 0 ]
    then
        echo "metaserver_test failed"
        exit
    fi

    ./bazel-bin/curvefs/test/mds/curvefs_mds_test

    if [ $? -ne 0 ]
    then
        echo "mds_test failed"
        exit
    fi
fi

echo "end compile"
