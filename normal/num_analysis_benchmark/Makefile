all: num_analysis_benchmark.native

ifneq (,$(findstring fyp,$(shell which ocamlopt)))
	ADDITIONAL_OCAML_FLAGS=-inlining-overrides overrides.sexp
endif

num_analysis_benchmark.native: micro_bench_types.ml dka_result.ml durand_kerner_aberth.ml fft_result.ml fft.ml k_means_ds.ml k_means.ml levinson_durbin_ds.ml levinson_durbin_result.ml levinson_durbin.ml lu_decomposition_result.ml lu_decomposition.ml naive_multilayer_ds.ml naive_multilayer.ml qr_decomposition_result.ml qr_decomposition.ml rnd_access.ml simple_access_a.ml simple_access.ml num_analysis_benchmark.ml
	ocamlopt -dflambda -inline-max-depth 5 -inlining-report \
	  $(ADDITIONAL_OCAML_FLAGS) -O3 -S -o $@ $^ 2>flambda.out

clean:
	echo '()' >overrides.sexp
	rm -rf *.cm* *.native *.o *.data_collector.sexp *.inlining.org
