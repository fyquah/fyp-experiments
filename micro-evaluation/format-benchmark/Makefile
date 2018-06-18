all: bench.native

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

bench.native:  micro_bench_types.ml bench.ml
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 1>stdout.log 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
