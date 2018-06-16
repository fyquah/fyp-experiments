all: bench.native 

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

bench.native: a.ml bench.ml
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report -g $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
