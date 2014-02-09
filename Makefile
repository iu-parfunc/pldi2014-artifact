
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

build: sandbox submod rebuild

rebuild:
	cabal install -j -f-fusion -f-hydra ./HSBencher ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN} 

mergesort_bench:
	$(MAKE) LVish_repo/haskell/par-transformers/bench/mergesort

monadpar_bench:
	cabal install -j -ftrace --disable-library-profiling --disable-documentation monad-par/examples/src/mandel/ monad-par/examples/src/sumeuler/ monad-par/examples/src/blackscholes/ monad-par/examples/src/parfib/

sandbox:
	cabal sandbox init

clean: submod clean-sandbox 

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	cabal sandbox delete
