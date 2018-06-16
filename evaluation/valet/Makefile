all: bench.native 

ifneq (,$(findstring fyp,$(shell which ocamlopt.opt)))
ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

bench.native: valet_core.ml valet_react.ml test_lib.ml bench.ml 
	ocamlfind ocamlopt -bin-annot -thread \
	  -package react,lwt,uuidm,ocplib-endian,unix,unix,lwt.unix \
	  -linkpkg -dflambda -inline-max-depth 5 -inline-max-unroll 5 -inlining-report -g $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.*.sexp
