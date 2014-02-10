
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

build: sandbox submod 
	cabal install -O2 -j vector-algorithms
	$(MAKE) rebuild

rebuild:
	cabal install --reinstall --force-reinstall -j -f-fusion -f-hydra ./HSBencher ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN} 

examples:
	cabal install LVish-examples/2.0

#------------------------------------------------------------
# Bench 1: Phybin

PHYBIN_CMD=./.cabal-sandbox/bin/phybin-par -n150 --single --rfdist ./hashrf/30.hashrf-6.0.0-dist-seed-option/examples/150-taxa-1000-trees.tre +RTS -K100M -RTS

phybin_bench:
	$(PHYBIN_CMD) +RTS -N1 > ./PhyBin/phybin_out1.txt
	$(PHYBIN_CMD) +RTS -N2 > ./PhyBin/phybin_out2.txt
	$(PHYBIN_CMD) +RTS -N3 > ./PhyBin/phybin_out3.txt
	$(PHYBIN_CMD) +RTS -N4 > ./PhyBin/phybin_out4.txt
	cat ./PhyBin/phybin_out?.txt | grep "Time to compute" > phybin_results.txt

#------------------------------------------------------------
# Bench 2: Transformer overheads


#------------------------------------------------------------
# Bench 3: Mergesort

mergesort_bench:
	cabal install LVish_repo/haskell/par-transformers/bench/mergesort/

#------------------------------------------------------------

monadpar_bench: submod
	(cd monad-par/examples && make)

sandbox:
	cabal sandbox init
	(cd monad-par/examples && cabal sandbox init --sandbox ../../.cabal-sandbox)

clean: submod clean-sandbox 

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	cabal sandbox delete
