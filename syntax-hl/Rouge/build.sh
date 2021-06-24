#!/bin/bash

for doc in *.asciidoc; do
	echo -e "Converting \"$doc\""
	asciidoctor \
		-r ./custom-rouge-adapter.rb \
		-a data-uri \
		$doc
done

echo -e "Compiling \"sample.alan\""
alan sample.alan
