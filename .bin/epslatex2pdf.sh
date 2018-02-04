#!/bin/sh
set -e
FILENAME=$(basename $1)
FILENAME=${FILENAME%.*}

DIR=$(dirname $1)
OUTDIR=$(mktemp -d epslatex2pdf_tmp.XXXXXX)

SIZE="${2}"

cd $OUTDIR

cat << EOS > ./main.tex
\documentclass[a4j,10pt,dvipdfmx]{jsarticle}
\usepackage{graphicx}
\graphicspath{{../}}
\pagestyle{empty}

\begin{document}
\begin{figure}[htb]
    \centering
    {\\${SIZE:-normalsize}\input{../${FILENAME}.tex}}
\end{figure}

\end{document}
EOS

[ -e ../${FILENAME}.pdf ] && rm ../${FILENAME}.pdf


latexmk ./main.tex
pdfcrop main.pdf

mv main-crop.pdf ${FILENAME}.pdf
mv ${FILENAME}.pdf ../

cd ../

rm -rf $OUTDIR
