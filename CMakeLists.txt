cmake_minimum_required(VERSION 3.16.3)
SET (PROJECTNAME "Faddeeva_Fortran")
project(${PROJECTNAME} Fortran)

add_subdirectory(errfun_MIT)

add_executable(main example.f90)
target_link_libraries(main Faddeeva_package)

if(${PROJECT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
    set(main_project TRUE)
else()
    set(main_project FALSE)
endif()

if (main_project AND NOT DEFINED BUILD_TESTING)
    set(BUILD_TESTING ON)
endif()

message(${main_project})
message(${BUILD_TESTING})
if((main_project AND BUILD_TESTING) OR BUILD_TESTING_${PROJECT_NAME})

    enable_testing()
    add_subdirectory(errfun_MIT/src/tests)
endif()