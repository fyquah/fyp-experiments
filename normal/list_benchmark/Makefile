all: list.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
	ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

list_benchmark.native:  micro_bench_types.ml list_benchmark.ml 
	ocamlopt -dflambda -inline-max-depth 5 -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
