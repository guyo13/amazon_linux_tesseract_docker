#!/bin/sh

do_cmake_shared() {
   	cmake .. -DBUILD_SHARED_LIBS=ON \
	&& make \
    && make install
}

do_cmake() {
   	cmake .. \
	&& make \
    && make install
}

setup_ldconfig() {
    echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
}

compile_leptonica() {
	wget https://github.com/DanBloomberg/leptonica/releases/download/1.83.1/leptonica-1.83.1.tar.gz \
	&& tar -xzf leptonica-1.83.1.tar.gz \
	&& cd leptonica-1.83.1 \
	&& mkdir build \
	&& cd build \
   	&& do_cmake_shared \
    && rm -rf * \
    && do_cmake
}

compile_tesseract() {
    wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.3.tar.gz \
	&& tar -xzf 5.3.3.tar.gz \
	&& cd tesseract-5.3.3 \
	&& mkdir build \
	&& cd build \
   	&& do_cmake_shared \
    && rm -rf * \
    && do_cmake
}

cleanup() {
    rm -rf tesseract-5.3.3 leptonica-1.83.1 leptonica-1.83.1.tar.gz 5.3.3.tar.gz
}

main() {
    setup_ldconfig \
    && compile_leptonica \
    && cd ../.. \
    && compile_tesseract \
    && cd ../.. \
    && cleanup \
	&& ldconfig -v
}

main
