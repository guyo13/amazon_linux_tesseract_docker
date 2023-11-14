#!/bin/sh
wget https://github.com/DanBloomberg/leptonica/releases/download/1.83.1/leptonica-1.83.1.tar.gz \
	&& tar -xzf leptonica-1.83.1.tar.gz \
	&& cd leptonica-1.83.1 \
	&& mkdir build \
	&& cd build \
    && cmake .. -DBUILD_SHARED_LIBS=ON \
    && make \
    && make install \
    && cd ../.. \
	&& wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.3.tar.gz \
	&& tar -xzf 5.3.3.tar.gz \
	&& cd tesseract-5.3.3 \
	&& mkdir build \
	&& cd build \
    && cmake .. -DBUILD_SHARED_LIBS=ON \
    && make \
    && make install \
    && cd ../.. \
    && rm -rf tesseract-5.3.3 leptonica-1.83.1 leptonica-1.83.1.tar.gz 5.3.3.tar.gz \
