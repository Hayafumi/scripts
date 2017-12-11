#!/bin/bash

pleasedie(){
	printf "<head>\\n <link rel=\"stylesheet\" href=\"style-min.css\">\\n</head>\\n<article>\\n\\n"
}

if [[ ! -f "$1" ]] || [[ -z "$1" ]]; then
	echo "Entered file does not exist"
else
	if ! grep -q "<link rel=stylesheet href=style-min.css>" "$1" && ! grep -q "</article>" "$1"; then
		if file "$1" | grep -q html || file "$1" | grep -q HTML; then
			pleasedie
			< "$1"
			<<< "</article>"
		else
			pleasedie
			markdown "$1"
			<<< "</article>"
		fi
	else
		< "$1"
	fi
fi