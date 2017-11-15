TARGETS=async_floating_point.native

OCAMLBUILD_OPTS=-use-ocamlfind -dflambda

.PHONY: all
all: async_floating_point.ml
	jbuilder build 2>dflambda.out
	cp _build/default/*.data_collector.sexp ./
	cp _build/default/async_floating_point.exe ./async_floating_point.native
	cp _build/default/async_floating_point.s ./

.PHONY: clean
clean:
	rm -rf _build/
	rm -f *.data_collector.sexp
	echo '()' >overrides.sexp
