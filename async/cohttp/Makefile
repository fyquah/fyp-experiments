TARGETS= cohttp_lwt_bench.native cohttp_async_bench.native

OCAMLBUILD_OPTS=-use-ocamlfind -dflambda

.PHONY: all
all: cohttp_async_bench.ml
	jbuilder build
	cp _build/default/*.data_collector.sexp ./

.PHONY: clean
clean:
	jbuilder clean
	rm -f *.data_collector.sexp
	echo '()' >overrides.sexp
