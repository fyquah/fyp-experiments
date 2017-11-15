all: b.native

b.native: a.mli a.ml b.ml
	ocamlopt -O3 -S \
	  -dflambda \
	  -inlining-overrides overrides.sexp \
	  -inline-max-depth 5 \
	  -inlining-report \
	  -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
