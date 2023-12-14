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

echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf \
	&& wget https://github.com/DanBloomberg/leptonica/releases/download/1.83.1/leptonica-1.83.1.tar.gz \
	&& tar -xzf leptonica-1.83.1.tar.gz \
	&& cd leptonica-1.83.1 \
	&& mkdir build \
	&& cd build \
   	&& do_cmake_shared \
    && rm -rf * \
    && do_cmake \
    && cd ../.. \
	&& wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.3.tar.gz \
	&& tar -xzf 5.3.3.tar.gz \
	&& cd tesseract-5.3.3 \
	&& mkdir build \
	&& cd build \
   	&& do_cmake_shared \
    && rm -rf * \
    && do_cmake \
    && cd ../.. \
    && rm -rf tesseract-5.3.3 leptonica-1.83.1 leptonica-1.83.1.tar.gz 5.3.3.tar.gz \
	&& ldconfig -v
