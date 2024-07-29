## BAZEL

Install bazel

```
    wget https://github.com/bazelbuild/bazel/releases/download/4.2.4/bazel-4.2.4-linux-x86_64
```

## Dependencies

### Rocky 9

```sh
sudo dnf install -y git tar git gcc-toolset-13* perl flex bision patch  java-1.8.0-openjdk-devel fuse3-devel  libnl3-devel libunwind-devel python3-devel

wget https://github.com/Kitware/CMake/releases/download/v3.30.1/cmake-3.30.1-linux-x86_64.tar.gz
tar zxvf cmake-3.29.0-linux-x86_64.tar.gz
sudo cp -rf cmake-3.30.1-linux-x86_64/bin/* /usr/local/bin/ &&   sudo cp -rf  cmake-3.30.1-linux-x86_64/share/* /usr/local/share && rm -rf cmake-3.30.1-linux-x86_64

source /opt/rh/gcc-toolset-13/enable
```

### Ubuntu(TODO)

```sh
#    # for cpp compile
#    sudo apt install vim unzip netcat net-tools tzdata wget git gcc g++ make automake maven openssl libssl-dev cmake libtool gpg
#    # for rocksdb
#    sudo apt install libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev libgflags-dev
#    # for curve
#    sudo apt install libfuse3-dev uuid-dev libfiu-dev liblz4-dev libbz2-dev libnl-genl-3-dev libunwind-dev
```

## Compilation

###  Install bazel

```sh
wget https://github.com/bazelbuild/bazel/releases/download/4.2.4/bazel-4.2.4-linux-x86_64 
```

### Build Third Party

```sh
git submodule sync
git submodule update --init --recursive 

cd third-party
cmake -S . -B build
cmake --build build -j 16
```

### Build Etcd Client

```sh
bash build_thirdparties.sh
```

### Build Curve and CurvFs
```sh
export BAZEL_JOBS=16

bash build.sh

bash buildfs.sh
```