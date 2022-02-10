cmake_minimum_required(VERSION 3.16.3)
SET (PROJECTNAME "Faddeeva_Fortran")
project(${PROJECTNAME} Fortran)

add_subdirectory(Faddeeva_package)

add_executable(example example.f90)
target_link_libraries(example Faddeeva_package)

#if(${PROJECT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
#    set(main_project TRUE)
#else()
#    set(main_project FALSE)
#endif()
#
#if (main_project AND NOT DEFINED BUILD_TESTING)
#    set(BUILD_TESTING ON)
#endif()
#