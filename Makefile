
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

build: sandbox submod
	cabal install -j -f-fusion hsbencher-1.5.1 ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN} 

temp:
	cabal install -f-fusion -f-hydra ./HSBencher/   -v

sandbox:
	cabal sandbox init

clean: submod clean-sandbox 

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	cabal sandbox delete
