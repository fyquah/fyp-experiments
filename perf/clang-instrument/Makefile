CREATE_LLVM_PROF=../../../autofdo/_install/bin/create_llvm_prof
LLVM_PROFDATA=llvm-profdata-5.0

all: llvm_prof.txt

sample_code: main.cpp
	clang++-5.0 -g $< -o $@

instr_code: main.cpp
	clang++-5.0 -g -fprofile-instr-generate $< -o $@

code.profraw: instr_code
	LLVM_PROFILE_FILE="$@" ./instr_code

llvm_prof.txt: code.profraw
	$(LLVM_PROFDATA) merge -output=$@ -text $<

.PHONY: clean
clean:
	rm llvm_prof.txt code.profraw instr_code
