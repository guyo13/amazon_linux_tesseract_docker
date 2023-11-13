FROM amazonlinux:2023

COPY ./compile-tess.sh ./

RUN dnf install -y poppler poppler-devel poppler-cpp poppler-cpp-devel g++ make wget tar automake pkgconf-pkg-config pango-devel pango cairo-devel cairo icu libicu-devel libicu cmake

RUN chmod +x ./compile-tess.sh && ./compile-tess.sh 

CMD ["/bin/sh"]
