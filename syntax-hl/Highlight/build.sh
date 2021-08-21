#!/bin/bash

export HIGHLIGHT_DATADIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/hl/"
echo "\$HIGHLIGHT_DATADIR: $HIGHLIGHT_DATADIR"

ADocDir="$HIGHLIGHT_DATADIR/adoc"
HamlDir="$HIGHLIGHT_DATADIR/haml"

asciidoctor \
	--verbose \
	-r $ADocDir/highlight-treeprocessor_mod.rb \
	--template-dir $HamlDir \
	-a source-highlighter=highlight \
	-a docinfo=shared-head \
	-a data-uri \
	-a experimental \
	-a icons=font \
	-a reproducible \
	-a sectanchors \
	-a toc=left \
	sample.asciidoc

