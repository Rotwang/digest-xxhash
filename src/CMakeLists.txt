cmake_minimum_required(VERSION 2.6)

project("xxHash" C)

set(INC_ROOT ${CMAKE_BINARY_DIR}/../lib
        CACHE INTERNAL "Something more informative should be here.")

if    (CMAKE_COMPILER_IS_GNUCC)
        add_definitions(-std=c99)
endif (CMAKE_COMPILER_IS_GNUCC)

set(sources
        xxhash.c
        version.c
)

add_library(${PROJECT_NAME} SHARED ${sources})

get_target_property(   xxhash_library_path ${PROJECT_NAME}        LOCATION)
get_filename_component(xxhash_library_name ${xxhash_library_path} NAME)

set(module_name_in      ${CMAKE_SOURCE_DIR}/xxHash.pm.in)
set(module_name_out_pm  ${CMAKE_BINARY_DIR}/xxHash.pm)
set(module_name_out_pir ${CMAKE_BINARY_DIR}/xxHash.pir)

configure_file(
        ${module_name_in}
        ${module_name_out_pm}
        @ONLY
)

# if you have gcc then you probably have GNU strip
if    ((NOT CMAKE_BUILD_TYPE STREQUAL "DEBUG") AND (CMAKE_COMPILER_IS_GNUCC))
        add_custom_command(TARGET ${PROJECT_NAME}
                POST_BUILD
                COMMAND ${CMAKE_STRIP} --strip-unneeded "${xxhash_library_path}"
                COMMENT "Stripping ${PROJECT_NAME} library."
        )
endif ((NOT CMAKE_BUILD_TYPE STREQUAL "DEBUG") AND (CMAKE_COMPILER_IS_GNUCC))

install(TARGETS ${PROJECT_NAME}
        LIBRARY
        DESTINATION ${INC_ROOT}/Digest/blib
)

install(FILES ${module_name_out_pm}
        DESTINATION ${INC_ROOT}/Digest
)
