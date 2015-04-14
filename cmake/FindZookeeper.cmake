# - Try to find Zookeeper
# Defines
#  Zookeeper_FOUND - System has Zookeeper
#  Zookeeper_INCLUDE_DIRS - The Zookeeper include directories
#  Zookeeper_LIBRARIES - The libraries needed to use Zookeeper
#  Zookeeper_DEFINITIONS - Compiler switches required for using LibZookeeper

set(Zookeeper_INCLUDE_PATHS /usr/include /usr/local/include)
set(Zookeeper_LIB_PATHS /usr/lib /usr/local/lib)
find_path(Zookeeper_INCLUDE_DIR NAMES zookeeper/zookeeper.h PATHS ${Zookeeper_INCLUDE_PATHS})
find_library(Zookeeper_LIBRARY NAMES zookeeper_mt PATHS ${Zookeeper_LIB_PATHS})

set(Zookeeper_LIBRARIES ${Zookeeper_LIBRARY})
set(Zookeeper_INCLUDE_DIRS ${Zookeeper_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Zookeeper DEFAULT_MSG Zookeeper_LIBRARY Zookeeper_INCLUDE_DIR)

mark_as_advanced(Zookeeper_INCLUDE_DIR Zookeeper_LIBRARY)
