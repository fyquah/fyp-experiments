all: kb.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

kb.native: kb.ml
	ocamlopt -dflambda -inline-max-depth 5 -inlining-report -inline-max-unroll 5 -g \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
