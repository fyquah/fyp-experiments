all: quicksort.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

quicksort.native: quicksort.ml
	ocamlopt -dflambda -inline-max-depth 20 -inline-max-unroll 20 -g \
	  -inlining-report $(ADDITIONAL_OCAML_FLAGS) \
	  -O3 -S -o $@ $^ \
	  2>flambda.out

clean:
	echo "()" > overrides.sexp
	-rm code quicksort.cm* quicksort.o quicksort.s *.data_collector.txt quicksort.native
