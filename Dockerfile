FROM zsol/haskell-platform-2013.2.0.0
RUN apt-get update
RUN apt-get install -y git
RUN git clone git@github.com:iu-parfunc/pldi14-artifact
RUN make sandbox
RUN make submodule