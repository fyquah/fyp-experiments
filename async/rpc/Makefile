SOURCES = rpc_common.ml rpc_protocol.ml rpc_client.ml rpc_server.ml
PACKAGES = -package async -package core
OPTIONS = -thread
OPTOBJS = $(SOURCES:.ml=.cmx)

.SUFFIXES: .ml .cmx

all: $(OPTOBJS)
	ocamlfind ocamlopt.opt -linkpkg $(OPTIONS) $(PACKAGES) $(OPTOBJS) -o rpc_server.native

.ml.cmx:
	ocamlfind ocamlopt.opt $(OPTIONS) $(PACKAGES) -c $<


.PHONY: clean
clean:
	rm -f *.cm[iox]
	rm -f *.o
	rm -f rpc_server.native
