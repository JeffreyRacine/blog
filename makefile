all: render stage

render:
	quarto render

stage:
	git add -A .

preview:

	quarto preview

clean:

	rm -rf docs _freeze .quarto
	find . -name ".DS_Store" -delete
	find . -name ".Rhistory" -delete
	find . \( -name "*~" -o -name "*.bak" \) -delete
