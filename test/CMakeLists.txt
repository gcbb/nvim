
cmake_minimum_required(VERSION 3.12)
project(cmake_template VERSION 1.0.0 LANGUAGES C)
set(CMAKE_C_COMPILER "cc")
set(ROOT_DIR ${CMAKE_SOURCE_DIR}) 

MACRO(HEADER_DIRECTORIES return_list)
    FILE(GLOB_RECURSE new_list *.h)
    SET(dir_list "")
    FOREACH(file_path ${new_list})
        GET_FILENAME_COMPONENT(dir_path ${file_path} PATH)
        SET(dir_list ${dir_list} ${dir_path})
    ENDFOREACH()
    LIST(REMOVE_DUPLICATES dir_list)
    SET(${return_list} ${dir_list})
ENDMACRO()
HEADER_DIRECTORIES(header_dir_list)
list(LENGTH header_dir_list header_dir_list_count)
message(STATUS "[INFO] Found ${header_dir_list_count} header directories.")
#target_include_directories( my_program PUBLIC ${header_dir_list} )# Recursive
include_directories(${header_dir_list})
file(GLOB_RECURSE SRC_LIST *.c)
file(GLOB_RECURSE HEAD_LIST *.h)
#file(GLOB SRC_LIST "src/app/SWC/*/*.c")
#file(GLOB HEAD_LIST "src/app/*/*/*.h")
#aux_source_directory(. SRC_LIST) 
#set(SRC_LIST test.c)
#set(SRC_LIST ${SRC_LIST} test.c)

#get_filename_component(rSRC_LIST ${RELATIVE_PATH} ABSOLUTE) 
#message(${SRC_LIST})
#message(${HEAD_LIST})

#file(RELATIVE_PATH RELATIVE_SRC_LIST "${SRC_LIST}" "${ROOT_DIR}") 
#include_directories(
    #${CMAKE_SOURCE_DIR}
#)
add_executable(demo ${SRC_LIST})
# CMakeLists


