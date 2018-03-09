all: bdd.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

bdd.native: bdd.ml
	ocamlopt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -g -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
