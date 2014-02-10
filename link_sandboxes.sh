#!/bin/bash

set -x 
set -e

SANDBOX=$1

ORIG=`pwd`

function link() {
   cabal sandbox init --sandbox $SANDBOX
}

(cd LVish_repo/haskell/par-transformers/bench/ && link)
(cd LVish_repo/haskell/par-transformers/bench/mergesort/ && link)

(cd monad-par/examples && link)

BENCHES="Microbench cholesky kmeans matmult nbody partree primes quicksort schedulers sorting sumeuler blackscholes coins mandel minimax parfib queens randomGen simple stream"

for dir in $BENCHES; do 
  cd $ORIG
  cd monad-par/examples/src/$dir
  link
done
