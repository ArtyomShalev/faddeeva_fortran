## CMakeLists was created based on http://johannes.tax/Unit_testing_with_Fortran_and_CTest.html
#
#cmake_minimum_required(VERSION 3.16.3)
#enable_language(C Fortran)
#enable_testing()
#
## returns the mangled symbol name for a Fortran function name
## The code below works for Intel Fortran on Windows and for Intel and GNU Fortran on Linux.
## It might be necessary to extend it for other compilers
#function (mangle_fortran_name CNAME FNAME)
#    set (TMP)
#    if (WIN32)
#        string (TOUPPER "${FNAME}" TMP)
#    else ()
#        string (TOLOWER "${FNAME}_" TMP)
#    endif ()
#    set (${CNAME} ${TMP} PARENT_SCOPE)
#endfunction ()
#
## takes a list of valid file names and returns a list of mangled names that then can be used further
#function (mangle_fortran_filename_list MANGLED)
#    set (TMP)
#    foreach (TFILE ${ARGN})
#        string (REGEX REPLACE ".f90$" "" TESTNAME ${TFILE})
#        mangle_fortran_name (C_TESTNAME ${TESTNAME})
#        list (APPEND TMP ${C_TESTNAME})
#    endforeach ()
#    set (${MANGLED} ${TMP} PARENT_SCOPE)
#endfunction()
#
## creates the test driver target and registers tests
#function (add_fortran_test_executable TARGET)
#    set (TEST_FILES ${ARGN})
#    mangle_fortran_filename_list (TEST_FILES_MANGLED ${TEST_FILES})
#
#    create_test_sourcelist (_ main.c ${TEST_FILES_MANGLED})
#
#    add_library (${TARGET}_fortran ${TEST_FILES})
#    add_executable (${TARGET} main.c)
#    target_link_libraries (${TARGET} ${TARGET}_fortran)
#
#    set (INDEX 0)
#    list (LENGTH TEST_FILES LEN)
#    while (${LEN} GREATER ${INDEX})
#        list (GET TEST_FILES ${INDEX} TEST_FILE)
#        list (GET TEST_FILES_MANGLED ${INDEX} TEST_FILE_MANGLED)
#        add_test (
#                NAME ${TEST_FILE}
#                COMMAND $<TARGET_FILE:${TARGET}> ${TEST_FILE_MANGLED})
#        math (EXPR INDEX "${INDEX} + 1")
#    endwhile ()
#endfunction ()
#
#
#add_fortran_test_executable (
#        testsuite
#        "Faddeeva_erf_test.f90")


include(GNUInstallDirs)

SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/tests/${CMAKE_INSTALL_BINDIR}")

function(add_Faddeeva_package_test test_src libraries)
    get_filename_component(test_name ${test_src} NAME_WE)
    get_filename_component(test_dir ${test_src} DIRECTORY)
    set(result_src "${test_dir}/${test_name}.result")

    add_executable(${test_name} ${test_src})
    foreach(lib IN LISTS libraries)
        target_link_libraries(${test_name} ${lib})
    endforeach()
    add_test(NAME ${test_name} COMMAND ${test_name})
    #
    #    file(STRINGS ${result_src} result_raw)
    #    string(REGEX REPLACE "([+.])([^+.]*)" "\\\\\\1\\2" result ${result_raw})
    #
    #    set_tests_properties(${test_name} PROPERTIES
    #        PASS_REGULAR_EXPRESSION "${result}"
    #    )
endfunction()

file(GLOB_RECURSE Faddeeva_package_tests *.f90)

foreach(Faddeeva_package_test IN LISTS Faddeeva_package_tests)
    add_Faddeeva_package_test(${Faddeeva_package_test} Faddeeva_package)
endforeach()