#!/bin/bash

asciidoctor \
	-r ./custom-rouge-adapter.rb \
	asciidoctor-example.asciidoc
