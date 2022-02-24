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
various error functions of arbitrary complex arguments. 

### Prerequisites

gcc, gfortran, cmake version 3.16.3 or higher.

### Installation

> git clone https://github.com/ArtyomShalev/Faddeeva_fortran.git

or as git submodule(see example project in "More resources")

> cd <your_main_project>
> 
> git submodule add https://github.com/ArtyomShalev/Faddeeva_fortran.git 

## Documentation
To generate documentation in html and latex formats 
doxygen should be installed and one needs:

> cd docs
> 
> doxygen config

The generated HTML documentation can be viewed by pointing a HTML browser to the index.html file in the
html directory. The generated LATEX documentation must first be compiled by a LATEX compiler.
## Tests

All functions from Faddeeva package are covered with tests. 
Test complex arguments were borrowed from original source Faddeeva.cc
file except Inf and NaN according they are not supported in Fortran 90. Reference values were computed by WolframAlpha.

### Launching the tests

> cmake .
> 
> make
> 
> ctest

## More resources

It may be useful to look at [example of using Faddeeva_fortran
as git submodule](....)


## About

This project was done with the assistance of [Konstantin 
Ladutenko](https://github.com/kostyfisik).