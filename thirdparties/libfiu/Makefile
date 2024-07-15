
.PHONY: download build clean

all: clean download build

build:
	@cd libfiu && make -j$(nproc)

download:
	@git submodule update --init --progress libfiu

clean:
	@cd libfiu && make clean

