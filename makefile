all:

	quarto render
	git add docs posts

clean:

	rm -rf docs */*~ */*/*~ */*/*/*~
