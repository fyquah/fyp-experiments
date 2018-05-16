OCAMLOPT=$(HOME)/fyp/ocaml/ocamlopt.opt
OCAMLFIND=/home/fyquah/.opam/4.05.0+fyp/bin/ocamlfind

all: main.native

main.native: main.ml
	$(OCAMLFIND) ocamlopt.opt -package async \
	  -linkpkg -thread -S \
	  main.ml

clean:
	rm -f main.o main.cm* main.native main.s a.out
