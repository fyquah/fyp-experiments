all: almabench.native

almabench.native: almabench.ml
	ocamlopt -dflambda -inline-max-depth 5 -inlining-report -inlining-overrides overrides.sexp -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
