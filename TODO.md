
Critical Path
-------------

 X [monad-par benchmarks, dev branch] mandel/primes -- blow away
   conditionals and commit to NEW_GENERIC, refactor to use 'irange'
   function for range construction
   X Currently, make monadpar_bench errors with problems with Range.

 * [RN] get monad-par benchmarks fully running... more bugs to fix
 
 * [LK] finish exposing Counter
 * [RN] switch phybin to new counter 
 
 * [LK] Write README, refer to examples and benchmarks
 * [LK] Write website, link github artifact 
 * [LK] Build VM, add to website
  * Btw, I verified that this docker container works for GHC
    https://index.docker.io/u/zsol/haskell-platform-2013.2.0.0/
    But a regular virtualbox VM is probably fine...     

 * [RN] Finish updating CancelT effect sigs

 X [STH] Make Haskell/C mergesort run
 * [?] Make Hashrf run 
 * [?] Make DPJ mergesort run
 * [?] Make Cilk mergesort run

Lower priority
--------------

 X [LK] Get basic examples with LVish 2.0 
 * [LK] Get examples with transformers 

 * [RN] try phybin with new par-folding for SLMap ... time permitting

 * [RN] Finish updating DeadlockT effect sigs, test it.



