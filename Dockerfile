FROM zsol/haskell-platform-2013.2.0.0
RUN cabal update
RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/iu-parfunc/pldi2014-artifact.git
# RUN make sandbox
# RUN make submodule