all: main.native


# -dflambda \
# -inlining-overrides overrides.sexp \

main.native: a.mli a.ml b.ml
	ocamlopt -O3 -S \
	  -inline-max-depth 5 \
	  -inlining-report \
	  -o $@ $^

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
