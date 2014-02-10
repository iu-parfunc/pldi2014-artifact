FROM zsol/haskell-platform-2013.2.0.0
RUN cabal update
RUN apt-get update
RUN apt-get install -y git graphviz
RUN git clone https://github.com/iu-parfunc/pldi2014-artifact.git
RUN cd pldi2014-artifact && make submod
RUN cd pldi2014-artifact && make sandbox
RUN cd pldi2014-artifact && make build
RUN cd pldi2014-artifact && make phybin_bench
RUN cd pldi2014-artifact && make mergesort_bench
ENV USER pldi
RUN cd pldi2014-artifact && make transformer_bench
