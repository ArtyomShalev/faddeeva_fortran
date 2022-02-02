cmake_minimum_required(VERSION 3.16.3)
SET (PROJECTNAME "Faddeeva_Fortran")
project(${PROJECTNAME} Fortran)

add_subdirectory(errfun_MIT)

add_executable(main example.f90)
target_link_libraries(main Faddeeva_package)
