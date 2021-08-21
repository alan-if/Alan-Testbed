@ECHO OFF
SET "HIGHLIGHT_DATADIR=%~dp0hl"
ECHO HIGHLIGHT_DATADIR: %HIGHLIGHT_DATADIR%

SET "ADocDir=%HIGHLIGHT_DATADIR%\adoc"
SET "HamlDir=%HIGHLIGHT_DATADIR%\haml"

ECHO ADocDir: %ADocDir%
ECHO HamlDir: %HamlDir%

asciidoctor ^
	--verbose ^
	-r %ADocDir%\highlight-treeprocessor_mod.rb ^
	--template-dir %HamlDir% ^
	-a source-highlighter=highlight ^
	-a docinfo=shared-head ^
	-a data-uri ^
	-a experimental ^
	-a icons=font ^
	-a reproducible ^
	-a sectanchors ^
	-a toc=left ^
	sample.asciidoc

EXIT /B
