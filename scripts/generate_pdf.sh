#!/bin/bash

set -e
# test passed in pandoc 1.19.1

_version_tag="$(date '+%Y%m%d').$(git rev-parse --short HEAD)"

pandoc -N --toc --smart --latex-engine=xelatex \
    --template=templates/template.tex \
    --listings \
    -V title="TiDB 中文手册" \
    -V author="PingCAP Inc." \
    -V date="v1.0~rc1+${_version_tag}" \
    -V CJKmainfont='Microsoft YaHei' \
    -V mainfont='Tsentsiu Sans HG' \
    -V sansfont='Tsentsiu Sans HG' \
    -V monofont='Tsentsiu Sans Console HG' \
    -V geometry:margin=1in \
    doc.md -o output.pdf
