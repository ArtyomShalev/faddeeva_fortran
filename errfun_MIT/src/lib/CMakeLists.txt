#add_library(MIT_lib Faddeeva.c)
#set_property(TARGET MIT_lib PROPERTY C_STANDARD 99)
##add_library(errfun faddeeva_fortran_interface.f90)
#
#add_executable(errfun erf_MIT.f90)
#target_link_libraries(errfun MIT_lib)

# set type specific output defaults
include(GNUInstallDirs)

SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}")
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}")
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}")
SET(CMAKE_Fortran_MODULE_DIRECTORY "${PROJECT_BINARY_DIR}/modules")

set(LIB Faddeeva_package)
add_library(${LIB}
        Faddeeva.c
        faddeeva_fortran_interface.f90
        )
add_library(${NAMESPACE}${LIB} ALIAS ${LIB})
set_property(TARGET ${LIB} PROPERTY C_STANDARD 99)

target_include_directories(${LIB}
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_Fortran_MODULE_DIRECTORY}>
        )


#target_compile_definitions(${LIB}
#    PRIVATE
#        ${r16p_supported}
#        ${ascii_supported}
#        ${ascii_neq_default}
#        ${ucs4_supported}
#)

set_target_properties(${LIB} PROPERTIES
        VERSION
        ${PROJECT_VERSION}
        SOVERSION
        ${PROJECT_VERSION_MAJOR}
        )

# installation and export of targets
install(DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY}/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
        COMPONENT Developement
        )

install(TARGETS ${LIB} EXPORT ${TARGETS_EXPORT_NAME}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT Development
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT RuntimeLibraries
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT RuntimeLibraries
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
        )
