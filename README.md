# Faddeeva_fortran

This project provides the [MIT Faddeeva package](http://ab-initio.mit.edu/wiki/index.php/Faddeeva_Package) 
interface to FORTRAN programming language. 

## Description

Efficient and correct calculation of the special functions is relevant in every field of science. 
S.G. Johnson MIT implementation of various error functions is the best
implementation according to [REVIEW OF CPU AND GPU FADDEEVA IMPLEMENTATIONS](https://inspirehep.net/literature/1470416)

## How to use the project

We recommend to use Linux operating system to run Faddeeva_fortran.
This project is not independent. It provides the Fortran module with
various error functions of arbitrary complex arguments. The project can be
downloaded in usual way: 

> git clone .....

or as git submodule(see example project in More resources)

> git submodule add .... 
### Prerequisites

To know from default ubuntu (gcc, gfortran, cmake)

## Documentation
To generate documentation in html and latex formats 
doxygen should be installed and one needs:

> cd docs
> 
> doxygen config

## More resources

It may be useful to look at [example of using Faddeeva_fortran
as git submodule](....)


## About

This project was done with the assistance of [Konstantin 
Ladutenko](https://github.com/kostyfisik).