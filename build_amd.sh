#!/bin/sh

docker build -t guyor/amazon_linux_tesseract:latest -t guyor/amazon_linux_tesseract:tess_5.3.3_aml_2023 --progress=plain -f amd64/Dockerfile . 2>&1
