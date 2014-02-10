pldi2014-artifact
=================

Welcome to the artifact evaluation bundle for "Taming the Parallel
Effect Zoo".  There are three components to this bundle:

  * Benchmark results
  * LVish code examples
  * LVish documentation
  
_LVars_ are monotonically growing, lattice-based data structures for
deterministic parallel programming. _LVish_ is a Haskell library for
programming with LVars.
  
First, follow the
[instructions for downloading and building the artifact bundle](http://www.cs.indiana.edu/~lkuper/effectzoo/).
Doing so will install LVish and its dependencies, build the LVish
documentation and examples, and run the benchmarks.

## Benchmark results 

Benchmark results for _PhyBin_, the bioinformatics application
described in section 8 of the paper, should appear in:

  * `phybin_out/`
  * `phybin_results.txt`
  
## LVish documentation

The Haddock-generated HTML documentation will appear in

  * `.cabal-sandbox/doc/html/Control-LVish.html`
  
## LVish code examples

The directory `LVish-examples/2.0/` contains a variety of toy examples
of LVish programs.  See `LVish-examples/2.0/README.md` for more
details.
