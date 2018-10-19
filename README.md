# esdl-core-conda

This repository provides scripts used to build and deploy various 
[esdl-core](https://github.com/esa-esdl/esdl-core) packages
for the [Anaconda](https://www.continuum.io/) and
[Miniconda](https://conda.io/miniconda.html) Python distributions.
 

## Building esdl Conda packages

Install `conda-build` in your **root** Miniconda:

    $ source activate
    $ conda install conda-build
    
Clone this repo:
    
    $ git clone https://github.com/esa-esdl/esdl-core-conda
    
Build a Conda package `gridtools` (see `recipes/esdl/meta.yaml`):
    
    $ cd esdl-core-conda
    $ conda build -c conda-forge -c defaults recipes/esdl
     
The `-c` (or `--channel`) option adds extra Anaconda *channels* to search for package 
dependencies. We must add `defaults` to search for Anaconda default packagers first, then
for packages from `conda-forge`, which hosts the `cartopy` versions required by Cate.

## Testing the Conda package

To test the new Conda package `esdl-core` in a test environment `gridtools-test`, type
     
    $ conda create -n esdl-core-test python=3
    $ source activate esdl-core-test
    $ conda install -c conda-forge --use-local esdl-core

## Deploying the Conda package

Just run the package build step with `--user <channel>`:

    $ conda build --user bc-dev -c conda-forge -c bc-dev -c ioos -c defaults recipes/esdl-core
