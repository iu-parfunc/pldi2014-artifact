
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

build: sandbox submod rebuild

rebuild:
	cabal install --reinstall --force-reinstall -j -f-fusion -f-hydra ./HSBencher ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN} 

mergesort_bench:
	cabal install LVish_repo/haskell/par-transformers/bench/mergesort/

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
