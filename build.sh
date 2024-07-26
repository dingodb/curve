#!/bin/bash -v

# Copyright (c) 2023 dingodb.com, Inc. All Rights Reserved
# Copyright (c) 2020 NetEase Inc.
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

dir=`pwd`
#step1 清除生成的目录和文件
#bazel clean
rm -rf curvefs_python/BUILD
rm -rf curvefs_python/tmplib/

git submodule update --init
if [ $? -ne 0 ]
then
    echo "submodule init failed"
    exit
fi

#step2 获取tag版本和git提交版本信息
#获取tag版本
tag_version=`git status | grep -w "HEAD detached at" | awk '{print $NF}' | awk -F"v" '{print $2}'`
if [ -z ${tag_version} ]
then
    echo "not found version info, set version to 9.9.9"
    tag_version=9.9.9
fi

#获取git提交版本信息
commit_id=`git show --abbrev-commit HEAD|head -n 1|awk '{print $2}'`
if [ "$1" = "debug" ]
then
    debug="+debug"
else
    debug=""
fi

curve_version=${tag_version}+${commit_id}${debug}

#step3 执行编译
# check bazel verion, bazel vesion must = 4.2.4
bazel_version=`bazel version | grep "Build label" | awk '{print $3}'`
if [ -z ${bazel_version} ]
then
    echo "please install bazel 4.2.4 first"
    exit
fi

if [ ${bazel_version} != "4.2.4" ]
then
    echo "bazel version must 4.2.4"
    echo "now version is ${bazel_version}"
    exit
fi

echo "bazel version : ${bazel_version}"

# check gcc version, gcc version must >= 4.8.5
gcc_version_major=`gcc -dumpversion | awk -F'.' '{print $1}'`
gcc_version_minor=`gcc -dumpversion | awk -F'.' '{print $2}'`
gcc_version_pathlevel=`gcc -dumpversion | awk -F'.' '{print $3}'`
if [ ${gcc_version_major} -lt 4 ]
then
    echo "gcc version must >= 4.8.5, current version is "`gcc -dumpversion`
    exit
fi

if [[ ${gcc_version_major} -eq 4 ]] && [[ ${gcc_version_minor} -lt 8 ]]
then
    echo "gcc version must >= 4.8.5, current version is "`gcc -dumpversion`
    exit
fi

if  [[ ${gcc_version_major} -eq 4 ]] && [[ ${gcc_version_minor} -eq 8 ]] && [[ ${gcc_version_pathlevel} -lt 5 ]]
then
    echo "gcc version must >= 4.8.5, current version is "`gcc -dumpversion`
    exit
fi
echo "gcc version : "`gcc -dumpversion`

echo "start compile"
# compile etcdclient manual
# cd ${dir}/thirdparties/etcdclient
# make clean
# make all
# if [ $? -ne 0 ]
# then
#     echo "make etcd client failed"
#     exit
# fi
# cd ${dir}

cp ${dir}/thirdparties/etcdclient/libetcdclient.h ${dir}/include/etcdclient/etcdclient.h

if [ `gcc -dumpversion | awk -F'.' '{print $1}'` -le 6 ]
then
    bazelflags="--jobs=${BAZEL_JOBS}"
else
    bazelflags="--copt -faligned-new --jobs=${BAZEL_JOBS}"
fi

if [ "$1" = "debug" ]
then
    bazel build ... --copt -DHAVE_ZLIB=1 --compilation_mode=dbg -s --define=with_glog=true \
    --define=libunwind=true --copt -DGFLAGS_NS=google --copt \
    -Wno-error=format-security --copt -DUSE_BTHREAD_MUTEX --copt -DCURVEVERSION=${curve_version} \
    --copt -DCLIENT_CONF_PATH="\"${g_root}/curvefs/conf/client.conf\"" \
    ${bazelflags}
    if [ $? -ne 0 ]
    then
        echo "build phase1 failed"
        exit
    fi

    bash ./curvefs_python/configure.sh python3

    if [ $? -ne 0 ]
    then
        echo "configure failed"
        exit
    fi

    bazel build curvefs_python:curvefs --copt -DHAVE_ZLIB=1 --compilation_mode=dbg -s \
    --define=with_glog=true --define=libunwind=true --copt -DGFLAGS_NS=google \
    --copt \
    -Wno-error=format-security --copt -DUSE_BTHREAD_MUTEX --linkopt \
    -L${dir}/curvefs_python/tmplib/ --copt -DCURVEVERSION=${curve_version} \
    --copt -DCLIENT_CONF_PATH="\"${g_root}/curvefs/conf/client.conf\"" \
     ${bazelflags}
    if [ $? -ne 0 ]
    then
        echo "build phase2 failed"
        exit
    fi
else
    bazel build ... --copt -DHAVE_ZLIB=1 --copt -O2 -s --define=with_glog=true \
    --define=libunwind=true --copt -DGFLAGS_NS=google --copt \
    -Wno-error=format-security --copt -DUSE_BTHREAD_MUTEX --copt -DCURVEVERSION=${curve_version} \
    --copt -DCLIENT_CONF_PATH="\"${g_root}/curvefs/conf/client.conf\"" \
    ${bazelflags}

    if [ $? -ne 0 ]
    then
        echo "build phase1 failed"
        exit
    fi

    bash ./curvefs_python/configure.sh python3
    if [ $? -ne 0 ]
    then
        echo "configure failed"
        exit
    fi

    bazel build curvefs_python:curvefs --copt -DHAVE_ZLIB=1 --copt -O2 -s \
    --define=with_glog=true --define=libunwind=true --copt -DGFLAGS_NS=google \
    --copt \
    -Wno-error=format-security --copt -DUSE_BTHREAD_MUTEX --linkopt \
    -L${dir}/curvefs_python/tmplib/ --copt -DCURVEVERSION=${curve_version} \
    --copt -DCLIENT_CONF_PATH="\"${g_root}/curvefs/conf/client.conf\"" \
    ${bazelflags}

    if [ $? -ne 0 ]
    then
        echo "build phase2 failed"
        exit
    fi
fi

echo "end compile"
