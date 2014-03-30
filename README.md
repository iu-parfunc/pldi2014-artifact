# Artifact for "Taming the Parallel Effect Zoo: Extensible Deterministic Parallelism with LVish"

Welcome to the artifact evaluation bundle for "Taming the Parallel
Effect Zoo!"

[Submitted version of paper](submitted.pdf) (superseded by camera-ready version)

## Build instructions

### Using [Docker](http://www.docker.io/)

Install Docker. If your Docker installation requires `root`, then
prefix the following commands with `sudo`.

#### The simplest way

  1. `docker build -t pldi2014-artifact github.com/iu-parfunc/pldi2014-artifact`
  2. `docker run -i -t pldi2014-artifact /bin/bash`
  3. Look around at the results as described [below](#artifact-description)

#### The pre-built way

If you use this approach, note that the benchmark results were
generated on our machines, not by you!  If you want to do it yourself,
see the _run-the-benchmarks-yourself_ way, described below.

  1. `docker pull iuparfunc/pldi2014-artifact`
  2. `docker run -i -t iuparfunc/pldi2014-artifact:bench /bin/bash`
  3. Look around at the results as described [below](#artifact-description)

#### The run-the-benchmarks-yourself way

  1. `docker pull iuparfunc/pldi2014-artifact`
  2. `docker run -e USER=pldi -i -t iuparfunc/pldi2014-artifact:build /bin/bash`
  3. `cd pldi2014-artifact`
  4. Build everything (will take some time): run `make everything`
  5. Look around at the results as described [below](#artifact-description)

### Not using Docker

Note that GHC 7.6.3 and Cabal 1.18 are _required_.

  1. Install the [Haskell Platform](http://www.haskell.org/platform/), version 2013.2.0.0, including GHC 7.6.3
  2. Install [Cabal 1.18](http://www.haskell.org/cabal/download.html) or newer
  3. Clone the artifact repo: run `git clone
  https://github.com/iu-parfunc/pldi2014-artifact.git`
  4. `cd pldi2014-artifact`
  5. Build everything (will take some time -- allow several hours): run `make everything`
  6. Look around at the results as described [below](#artifact-description)

#### Troubleshooting

**I got a `cabal: unrecognised command: sandbox` error!**

What does `cabal --version` say?  If you have a version older than 1.18, you'll need to upgrade to 1.18 or newer to support the `sandbox` feature.

**I got a `cabal: Could not resolve dependencies` error!**

What does `ghc --version` say?  Make sure to use GHC 7.6.3.

## AEC conflicts

Eric Holk, Vincent St-Amour

## Artifact description

There are three components to this bundle:

  * Benchmark results
  * LVish documentation
  * LVish code examples
  
_LVars_ are monotonically growing, lattice-based data structures for
deterministic parallel programming. _LVish_ is a Haskell library for
programming with LVars.
  
First, follow the
[instructions for downloading and building the artifact bundle](#build-instructions).
Doing so will install LVish and its dependencies, build the LVish
documentation and examples, and run the benchmarks.

## Benchmark results 

### PhyBin

Benchmark results for _PhyBin_, the LVish bioinformatics application
described in section 7.1 of the paper, should appear in
`phybin_results.txt`.

If you ran `make everything`, `phybin_results.txt` should already
exist.  Alternatively, to build and run _only_ the PhyBin benchmarks,
run `make phybin_bench`.

### Monad transformer overhead

Benchmark results for evaluating monad tranformer overhead, described
in section 7.2 of the paper, should appear in
`transformer_results.txt`.

If you ran `make everything`, `transformer_results.txt` should already
exist.  Alternatively, to build and run _only_ the transformer
benchmarks, run `make transformer_bench`.

### Parallel merge sort

Benchmark results for parallel merge sort in LVish, described in
section 7.3 of the paper, should appear in

  * `hs_mergesort_results.txt`
  * `c_mergesort_results.txt`
  
Each of those files will contain three numbers, one per line, which
are running times (in seconds) on 1, 2, and 4 cores, respectively.
`c_mergesort_results.txt` is the version that bottoms out with a
library call to a sequential C sort (the version marked as "ParST/C"
in Figure 5 of the paper); `hs_mergesort_results.txt` is a pure
Haskell version ("ParST/HSonly" in the table in Figure 5 of the
paper).

If you ran `make everything`, `hs_mergesort_results.txt` and
`c_mergesort_results.txt` should already exist.  Alternatively, to
build and run _only_ the merge sort benchmarks, run `make
mergesort_bench`.

## LVish documentation

The Haddock-generated HTML documentation will appear inside the
 `.cabal-sandbox/share/doc/` directory.
 
The main package provides the entrypoint [Control.LVish](http://htmlpreview.github.io/?https://github.com/iu-parfunc/pldi2014-artifact/blob/master/apidocs/lvish-2.0/html/index.html), as well as various LVar datatypes.

[Par-transformers](http://htmlpreview.github.io/?https://github.com/iu-parfunc/pldi2014-artifact/blob/master/apidocs/par-transformers-1.1/html/index.html) layers on additonal effects not found in the main module.

## LVish code examples

The directory `LVish-examples/2.0/` contains a variety of toy examples
of LVish programs.  See `LVish-examples/2.0/README.md` for more
details.
