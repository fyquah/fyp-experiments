OCAMLOPT=../../../ocaml/ocamlopt

all: almabench.native

almabench.native: almabench.ml
	$(OCAMLOPT) -dflambda -inlining-report -inlining-overrides overrides.sexp -o $@ $^ 2>flambda.out

clean:
	rm -rf *.cm* *.native *.o *.data_collector.txt
