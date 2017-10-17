CREATE_LLVM_PROF=../../../autofdo/_install/bin/create_llvm_prof
LLVM_PROFDATA=llvm-profdata-5.0

all: llvm_prof.txt

run: perf.data

code: main.cpp
	clang++ -fno-omit-frame-pointer -g $< -o $@

perf.data: code
	perf record --output=$@ --call-graph lbr -- ./$<

llvm.prof: code perf.data
	$(CREATE_LLVM_PROF) --profile=perf.data \
	  --binary=code --out=$@

llvm_prof.txt: llvm.prof
	$(LLVM_PROFDATA) merge -output $@ -text -sample $<

clean:
	rm gcov.out code llvm.prof llvm_prof.txt
