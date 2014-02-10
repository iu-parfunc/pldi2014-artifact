FROM zsol/haskell-platform-2013.2.0.0
ENV USER pldi
RUN cabal update
RUN apt-get update
RUN apt-get install -y git graphviz
RUN git clone https://github.com/iu-parfunc/pldi2014-artifact.git
WORKDIR pldi2014-artifact
RUN make submod
RUN make sandbox
RUN make build

FROM zsol/haskell-platform-2013.2.0.0
ENV USER pldi
RUN cabal update
RUN apt-get update
RUN apt-get install -y git graphviz
RUN git clone https://github.com/iu-parfunc/pldi2014-artifact.git
WORKDIR pldi2014-artifact
RUN make submod
RUN make sandbox
RUN make build
RUN make phybin_bench
RUN make mergesort_bench
RUN make transformer_bench
