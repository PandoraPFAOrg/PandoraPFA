# Jan Engels, DESY

# helper macro for generating project configuration file
MACRO( PANDORA_GENERATE_PACKAGE_CONFIGURATION_FILES )

    FIND_PATH ( PANDORA_CMAKE_MODULES_PATH "MacroCheckPackageVersion.cmake" ${CMAKE_MODULE_PATH} )

    FOREACH( arg ${ARGN} )
        IF( ${arg} MATCHES "Config.cmake" )
            IF( EXISTS "${PROJECT_SOURCE_DIR}/cmake/${arg}.in" )
                CONFIGURE_FILE( "${PROJECT_SOURCE_DIR}/cmake/${arg}.in"
                                "${PROJECT_BINARY_DIR}/${arg}" @ONLY
                )
                INSTALL( FILES "${PROJECT_BINARY_DIR}/${arg}" DESTINATION . )
            ENDIF()
        ENDIF()


        IF( ${arg} MATCHES "ConfigVersion.cmake" )
            # version configuration file
            IF( EXISTS "${PROJECT_SOURCE_DIR}/cmake/${arg}.in" )
                CONFIGURE_FILE( "${PROJECT_SOURCE_DIR}/cmake/${arg}.in"
                                "${PROJECT_BINARY_DIR}/${arg}" @ONLY
                )
                INSTALL( FILES "${PROJECT_BINARY_DIR}/${arg}" DESTINATION . )
            ENDIF( EXISTS "${PROJECT_SOURCE_DIR}/cmake/${arg}.in" )
        ENDIF()

        IF (${arg} MATCHES "LibDeps.cmake")
            # Deprecated in modern CMake (CMP0033) — no replacement needed
            message(STATUS "Skipping deprecated export_library_dependencies for ${arg}")
        ENDIF()

    ENDFOREACH()

ENDMACRO( PANDORA_GENERATE_PACKAGE_CONFIGURATION_FILES )

