all: main.native 

classic: main_oclassic.native 

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

main_oclassic.native: main.ml print.c
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report -g \
	  $(ADDITIONAL_OCAML_FLAGS) -Oclassic -S -o $@ $^ 2>flambda.out

main.native: main.ml print.c
	ocamlopt.opt -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report -g \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp
