FROM julia:1.2

RUN apt-get update && apt-get install -y \
    autoconf \
    autogen \
    build-essential \
    cmake \
    cmake-data \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libgmp-dev \
    libmpfr-dev \
    git

RUN julia -e 'using Pkg; Pkg.add(PackageSpec(name="GAP", rev="master")); using GAP'

# notebookで表示するため
RUN julia -e 'import Pkg; Pkg.add("PyCall"); Pkg.add("Conda"); using Conda; Conda.add("jupyterlab"); Pkg.add("IJulia")'

WORKDIR /lab

COPY ./ ./

# #+++++ start up jupyter lab +++++#
CMD ["/root/.julia/conda/3/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
