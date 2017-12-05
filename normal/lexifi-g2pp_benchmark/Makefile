all: lexifi-g2pp_benchmark.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

lexifi-g2pp_benchmark.native: date.mli optimization.mli math.mli g2pp_calibration.mli  date.ml math.ml  optimization.ml g2pp_calibration.ml main.ml
	ocamlopt -dflambda -inline-max-depth 5 -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
