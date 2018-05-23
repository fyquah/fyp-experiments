all: lens_benchmark.native

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

lens_benchmark.native: lens.mli micro_bench_types.ml lens.ml lens_benchmark.ml
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
