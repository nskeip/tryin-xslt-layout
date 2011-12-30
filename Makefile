all:
	xsltproc ./index.xsl ./index.xml > ./index.html

clean:
	rm ./index.html
