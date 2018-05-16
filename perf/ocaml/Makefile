CREATE_LLVM_PROF=../../../autofdo/_install/bin/create_llvm_prof
LLVM_PROFDATA=llvm-profdata-5.0
all: perf.data

run: perf.data

code: quicksort.ml
	ocamlopt.opt -g -S $< -o $@

perf.data: code
	perf record --call-graph=dwarf -a --output=$@ -b -- \
	  ./$< >/dev/null

llvm.prof: code perf.data
	$(CREATE_LLVM_PROF) --profile=perf.data \
	  --binary=code --out=$@

llvm_prof.txt: llvm.prof
	$(LLVM_PROFDATA) merge -output $@ -text -sample $<

.PHONY: report
report:
	/home/fyquah/dev/fyp/linux/tools/perf/perf report \
	  --branch-history --stdio --no-children

clean:
	rm llvm_prof.txt llvm.prof perf.data code \
	  quicksort.cm* quicksort.o quicksort.s perf.data.old
