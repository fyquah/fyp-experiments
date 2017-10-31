OCAMLOPT=../../../ocaml/ocamlopt

all: almabench.native

almabench.native: almabench.ml
	$(OCAMLOPT) -dflambda -inline-max-depth 2 -inlining-report -inlining-overrides overrides.sexp -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
