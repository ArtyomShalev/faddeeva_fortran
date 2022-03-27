# The target of the library Faddeeva_fortran is exported
# as faddeeva_fortran::faddeeva_fortran to a package config file for faddeeva_fortran
#
# usage:
#     find_package(faddeeva_fortran)
#     ...
#     target_link_library(<target> faddeeva_fortran)
#
# the config file is generatet in the build and install directories
#TODO cmake version
cmake_minimum_required(VERSION 3.16.3)
project(faddeeva_fortran VERSION 2.0.3 LANGUAGES Fortran C)

# seach path for additional cmake modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake/Modules)


# set export variables needed for building
set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
set(NAMESPACE "${PROJECT_NAME}::")

# generate the library and install instructions
add_subdirectory(src/lib)

# testing
if(${PROJECT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
    set(main_project TRUE)
else()
    set(main_project FALSE)
endif()

include(CMakeDependentOption)
cmake_dependent_option(BUILD_TESTING_${PROJECT_NAME}
        "Build the testing tree for project ${PROJECT_NAME}." OFF
        "BUILD_TESTING;NOT main_project" OFF
        )

if (main_project AND NOT DEFINED BUILD_TESTING)
    set(BUILD_TESTING ON)
endif()

if((main_project AND BUILD_TESTING) OR BUILD_TESTING_${PROJECT_NAME})
    enable_testing()
    add_subdirectory(src/tests)
endif()
