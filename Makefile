
MONAD_PAR_PKGS=monad-par/monad-par monad-par/monad-par-extras monad-par/abstract-par

LVISH_PKGS=LVish_repo/haskell/par-classes LVish_repo/haskell/lvish LVish_repo/haskell/par-transformers LVish_repo/haskell/par-collections 

build: sandbox submod
	cabal install -j ${LVISH_PKGS} ${MONAD_PAR_PKGS}

sandbox:
	cabal sandbox init

submod:
	git submodule init
	git submodule update --recursive

clean-sandbox:
	rm -rf .cabal-sandbox/
