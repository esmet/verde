cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -Wall -Wextra -Werror -g3") 
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-g2 -O2")

find_package(LibEvent REQUIRED)
find_package(Zookeeper REQUIRED)

list(APPEND VERDE_SRC
    verde/verde.c
)

list(APPEND VERDE_HEADERS
    verde/verde.h
)

add_library(verde SHARED ${VERDE_SRC} ${VERDE_HEADERS})

list(APPEND VERDE_LIBS
    verde
    ${Zookeeper_LIBRARIES}
    ${LIBEVENT_LIBRARY}
)

include_directories(.)

add_subdirectory(examples)
