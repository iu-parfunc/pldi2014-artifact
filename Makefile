
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections LVish_repo/haskell/par-transformers/bench

PHYBIN=PhyBin/

build: sandbox 
	cabal install -j -f-fusion ${LVISH_PKGS} ${MONAD_PAR_PKGS} ${PHYBIN}


sandbox:
	cabal sandbox init

clean: submod clean-sandbox 

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	rm -rf .cabal-sandbox/
