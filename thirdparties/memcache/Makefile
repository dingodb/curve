
.PHONY: download build clean

build: clean download
	@cd libmemcached-1.1.2 && mkdir build-libmemcached && cd build-libmemcached && cmake .. && make libmemcached -j$$(nproc)
	@cp libmemcached-1.1.2/build-libmemcached/include/libmemcached-1.0/configure.h libmemcached-1.1.2/include/libmemcached-1.0

download: libmemcached-1.1.2.tar.gz
	@wget https://github.com/awesomized/libmemcached/archive/refs/tags/1.1.2.tar.gz && mv 1.1.2.tar.gz libmemcached-1.1.2.tar.gz && tar -zxf libmemcached-1.1.2.tar.gz

clean:
	@rm -fr libmemcached-1.1.2/
