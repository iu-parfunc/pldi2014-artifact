
Critical Path
-------------

 * [monad-par benchmarks, dev branch] mandel/primes -- blow away
   conditionals and commit to NEW_GENERIC, refactor to use 'irange'
   function for range construction
   * Currently, make monadpar_bench errors with problems with Range.
      
 * switch phybin to new counter
 
 * Write README, refer to examples and benchmarks
 * Write website, link github artifact
 * Build VM, add to website
  * Btw, I verified that this docker container works for GHC
    https://index.docker.io/u/zsol/haskell-platform-2013.2.0.0/
    But a regular virtualbox VM is probably fine...
     

 * Finish updating CancelT effect sigs

 * Make Hashrf run 
 * Make DPJ mergesort run
 * Make Cilk mergesort run

Lower priority
--------------

 X Get basic examples with LVish 2.0 
 * Get examples with transformers 

 * try phybin with new par-folding for SLMap ... time permitting




