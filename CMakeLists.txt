cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -g3") 
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-g2 -O2")

find_package(Libevent REQUIRED)
find_package(Zookeeper REQUIRED)

list(APPEND VERDE_SRC
    verde/verde.c
)

add_executable(verde ${VERDE_SRC})

list(APPEND LIBS
    ${Zookeeper_LIBRARIES}
    ${LIBEVENT_LIBRARY}
)

target_link_libraries(verde ${LIBS})
