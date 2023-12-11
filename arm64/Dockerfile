FROM arm64v8/amazonlinux:2023

COPY ../compile-tess.sh ./

RUN dnf install -y poppler poppler-devel poppler-cpp poppler-cpp-devel g++ make wget tar automake pkgconf-pkg-config pango-devel pango cairo-devel cairo icu libicu-devel libicu cmake libjpeg-turbo libjpeg-turbo-devel libtiff libtiff-devel libpng libpng-devel

RUN chmod +x ./compile-tess.sh && ./compile-tess.sh && rm ./compile-tess.sh

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

ENV LD_LIBRARY_PATH=/usr/local/lib

CMD ["/bin/sh"]
