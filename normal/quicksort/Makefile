CREATE_LLVM_PROF=../../../autofdo/_install/bin/create_llvm_prof
LLVM_PROFDATA=llvm-profdata-5.0
OCAMLOPT=../../../ocaml/ocamlopt

.PHONY: all report

all: report

code: quicksort.ml
	$(OCAMLOPT) -O3 -inlining-report -g -S $< -o $@

report: code
	./$< >/dev/null

clean:
	rm code quicksort.cm* quicksort.o quicksort.s *.data_collector.txt
