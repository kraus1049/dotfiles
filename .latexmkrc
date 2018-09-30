#!/usr/bin/env perl

$platex = 0;
$uplatex = !$platex;
if ($platex == 1) {
	$latex = 'platex -kanji=utf-8 -synctex=1 -halt-on-error -interaction=nonstopmode %S';
	$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
	$bibtex = 'pbibtex';
	$biber  = 'biber --bblencoding=utf8 -u -U --output_safechars';
	$dvipdf = 'dvipdfmx %O -I 24 -o %D %S';
	$makeindex        = 'mendex %O -o %D %S';
	$pdf_mode = 3; # use dvipdf
	$pdf_update_method = 2;
	$pdf_previewer = "start mupdf %O %S";
	$max_repeat       = 5;
# Prevent latexmk from removing PDF after typeset.
	$pvc_view_file_via_temporary = 0;

	if ($^O eq 'darwin') {
			$pdf_previewer = 'open -a Preview';
	} elsif ($^O eq 'linux') {
			$pdf_previewer = 'evince';
	}
} elsif ($uplatex == 1) {
	$latex = 'uplatex -kanji=utf-8 -synctex=1 -halt-on-error -interaction=nonstopmode %S';
	$latex_silent = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
	$bibtex = 'upbibtex';
	$biber  = 'biber --bblencoding=utf8 -u -U --output_safechars';
	$dvipdf = 'dvipdfmx %O -o %D %S';
	# $dvipdf = 'dvipdfmx %O -I 24 -o %D %S';
	$makeindex        = 'upmendex %O -o %D %S';
	$pdf_mode = 3; # use dvipdf
	$pdf_update_method = 2;
	$pdf_previewer = "start mupdf %O %S";
	$max_repeat       = 5;
# Prevent latexmk from removing PDF after typeset.
	$pvc_view_file_via_temporary = 0;

	if ($^O eq 'darwin') {
			$pdf_previewer = 'open -a Preview';
	} elsif ($^O eq 'linux') {
			$pdf_previewer = 'evince';
	}
} else {

}

