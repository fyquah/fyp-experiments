all: sequence_cps_benchmark.native

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

sequence_cps_benchmark.native: sequence_cps.ml sequence_cps_benchmark.ml
	ocamlopt.opt -dflambda -inline-max-depth 5 -inlining-report -g -inline-max-unroll 5 \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
