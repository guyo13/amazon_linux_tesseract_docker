#!/bin/sh

BASE_DIR=`pwd`
TESS_DIR="$BASE_DIR/tesseract-5.3.3"
LEPT_DIR="$BASE_DIR/leptonica-1.83.1"
NUM_THREADS=`nproc`
MAKE_FLAGS="-j$NUM_THREADS"

do_cmake_shared() {
    cmake .. -DBUILD_SHARED_LIBS=ON \
    && make $MAKE_FLAGS \
    && make install
}

do_cmake() {
    cmake .. \
    && make $MAKE_FLAGS \
    && make install
}

setup_ldconfig() {
    echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
}

download_leptonica() {
	wget https://github.com/DanBloomberg/leptonica/releases/download/1.83.1/leptonica-1.83.1.tar.gz \
	&& tar -xzf leptonica-1.83.1.tar.gz
}

download_tesseract() {
    wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.3.tar.gz \
	&& tar -xzf 5.3.3.tar.gz
}

compile_shared() {
    cd $LEPT_DIR \
    && mkdir build \
    && cd build \
    && do_cmake_shared \
    && rm -rf * \
    cd $TESS_DIR \
    && mkdir build \
    && cd build \
    && do_cmake_shared \
    && rm -rf * \
    && cd $BASE_DIR
}

compile_static() {
    cd $LEPT_DIR \
    && mkdir build \
    && cd build \
    && do_cmake \
    && rm -rf * \
    cd $TESS_DIR \
    && mkdir build \
    && cd build \
    && do_cmake \
    && rm -rf * \
    && cd $BASE_DIR
}

cleanup() {
    if [ -d "$TESS_DIR" ]; then
        rm -rf $TESS_DIR
    fi
    if [ -d "$LEPT_DIR" ]; then
        rm -rf $LEPT_DIR
    fi
    if [ -f "leptonica-1.83.1.tar.gz" ]; then
        rm leptonica-1.83.1.tar.gz
    fi
    if [ -f "5.3.3.tar.gz" ]; then
        rm 5.3.3.tar.gz
    fi
}

main() {
    cleanup \
    && setup_ldconfig \
    && download_leptonica \
    && download_tesseract \
    && compile_shared \
    && compile_static \
    && cleanup \
    && ldconfig -v
}

main
