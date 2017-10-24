OCAMLOPT=../../../ocaml/ocamlopt

all: almabench.native

almabench.native: almabench.ml
	$(OCAMLOPT) -dflambda -inlining-report -O3 -o $@ $^ 2>flambda.out

clean:
	rm -rf *.cm* *.native *.o
