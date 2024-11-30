all:

	quarto render
	git add docs posts

preview:

	quarto preview

clean:

	rm -rf docs _freeze */*~ */*/*~ */*/*/*~ */*.bak */*/*.bak */*/*/*.bak
