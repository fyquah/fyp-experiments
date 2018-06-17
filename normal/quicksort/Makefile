all: quicksort.native

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

quicksort.native: quicksort.ml
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -g \
	  -inlining-report $(ADDITIONAL_OCAML_FLAGS) \
	  -O3 -S -o $@ $^ \
	  1>stdout.log 2>flambda.out

clean:
	echo "()" > overrides.sexp
	-rm code quicksort.cm* quicksort.o quicksort.s *.data_collector.txt quicksort.native
