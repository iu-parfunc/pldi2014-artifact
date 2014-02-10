
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par monad-par/examples/

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

CABAL_ARGS= --disable-documentation --disable-library-profiling --reinstall --force-reinstall -j

SANDBOX=$(shell pwd)/.cabal-sandbox/

BIN=$(SANDBOX)/bin/

build: sandbox submod 
	cabal install -O2 -j vector vector-algorithms
	$(MAKE) rebuild

rebuild:
	cabal install $(CABAL_ARGS) -f-fusion -f-hydra ./HSBencher ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN} 

examples:
	cabal install LVish-examples/2.0

#------------------------------------------------------------
# Bench 1: Phybin

PHYBIN_CMD=$(BIN)/phybin-par -n150 --single --rfdist ./hashrf/30.hashrf-6.0.0-dist-seed-option/examples/150-taxa-1000-trees.tre +RTS -K100M -RTS

phybin_bench:
	$(PHYBIN_CMD) +RTS -N1 > ./PhyBin/phybin_out1.txt
	$(PHYBIN_CMD) +RTS -N2 > ./PhyBin/phybin_out2.txt
	$(PHYBIN_CMD) +RTS -N3 > ./PhyBin/phybin_out3.txt
	$(PHYBIN_CMD) +RTS -N4 > ./PhyBin/phybin_out4.txt
	cat ./PhyBin/phybin_out?.txt | grep "Time to compute" > phybin_results.txt

#------------------------------------------------------------
# Bench 2: Transformer overheads

transformer_bench: 
	(cd monad-par/examples; ./generate_cabal.sh)
	(cd monad-par/examples; $(BIN)/run_benchmark_monadpar --lvish --lvish-state --lvish-cancel)

#------------------------------------------------------------
# Bench 3: Mergesort

MERGESORT_BENCH=$(BIN)/run_benchmark_mergesort

MERGESORT_CMD=$(BIN)/test-mergesort-parST 25 8192 8192 
HS_MERGESORT_CMD=$(MERGESORT_CMD) VAMSort MPMerge
C_MERGESORT_CMD=$(MERGESORT_CMD) CSort CMerge

mergesort_setup:
	mkdir -p mergesort/
	cabal install LVish_repo/haskell/par-transformers/bench/
	cabal install LVish_repo/haskell/par-transformers/bench/mergesort/

mergesort_bench: mergesort_setup
	$(HS_MERGESORT_CMD) +RTS -N1 > mergesort/hs_mergesort1.txt
	$(HS_MERGESORT_CMD) +RTS -N2 > mergesort/hs_mergesort2.txt
	$(HS_MERGESORT_CMD) +RTS -N4 > mergesort/hs_mergesort4.txt
	$(C_MERGESORT_CMD) +RTS -N1 > mergesort/c_mergesort1.txt
	$(C_MERGESORT_CMD) +RTS -N2 > mergesort/c_mergesort2.txt
	$(C_MERGESORT_CMD) +RTS -N4 > mergesort/c_mergesort4.txt
	cat ./mergesort/hs_mergesort*.txt | grep "SELF" > hs_mergesort_results.txt
	cat ./mergesort/c_mergesort*.txt | grep "SELF" > c_mergesort_results.txt

mergesort_bench_large: mergesort_setup
	$(MAKE) mergesort_bench_large_hs
	$(MAKE) mergesort_bench_large_c
	cat ./mergesort/hs_mergesort*.txt | grep "SELF" > hs_mergesort_results.txt
	cat ./mergesort/c_mergesort*.txt | grep "SELF" > c_mergesort_results.txt

mergesort_bench_large_hs:
	$(HS_MERGESORT_CMD) +RTS -N1 > mergesort/hs_mergesort1.txt
	$(HS_MERGESORT_CMD) +RTS -N2 > mergesort/hs_mergesort2.txt
	$(HS_MERGESORT_CMD) +RTS -N4 > mergesort/hs_mergesort4.txt
	$(HS_MERGESORT_CMD) +RTS -N6 > mergesort/hs_mergesort6.txt
	$(HS_MERGESORT_CMD) +RTS -N8 > mergesort/hs_mergesort8.txt
	$(HS_MERGESORT_CMD) +RTS -N10 > mergesort/hs_mergesort10.txt
	$(HS_MERGESORT_CMD) +RTS -N12 > mergesort/hs_mergesort12.txt
mergesort_bench_large_c:
	$(C_MERGESORT_CMD) +RTS -N1 > mergesort/c_mergesort1.txt
	$(C_MERGESORT_CMD) +RTS -N2 > mergesort/c_mergesort2.txt
	$(C_MERGESORT_CMD) +RTS -N4 > mergesort/c_mergesort4.txt
	$(C_MERGESORT_CMD) +RTS -N6 > mergesort/c_mergesort6.txt
	$(C_MERGESORT_CMD) +RTS -N8 > mergesort/c_mergesort8.txt
	$(C_MERGESORT_CMD) +RTS -N10 > mergesort/c_mergesort10.txt
	$(C_MERGESORT_CMD) +RTS -N12 > mergesort/c_mergesort12.txt

#------------------------------------------------------------

monadpar_bench: submod
	(cd monad-par/examples && make)

sandbox:
	cabal sandbox init
	(cd monad-par/examples && cabal sandbox init --sandbox $(SANDBOX))
	(cd LVish_repo/haskell/par-transformers/bench/ && cabal sandbox init --sandbox $(SANDBOX))
	(cd LVish_repo/haskell/par-transformers/bench/mergesort/ && cabal sandbox init --sandbox $(SANDBOX))

clean: submod clean-sandbox 

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	cabal sandbox delete
