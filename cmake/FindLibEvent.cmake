# - Try to find the LibEvent config processing library
# Once done this will define
#
# LIBEVENT_FOUND - System has LibEvent
# LIBEVENT_INCLUDE_DIR - the LibEvent include directory
# LIBEVENT_LIBRARIES 0 The libraries needed to use LibEvent

set(LibEvent_EXTRA_PREFIXES /usr/local/adnxs "$ENV{HOME}")
foreach(prefix ${LibEvent_EXTRA_PREFIXES})
  list(APPEND LibEvent_INCLUDE_PATHS "${prefix}/include")
  list(APPEND LibEvent_LIB_PATHS "${prefix}/lib")
endforeach()

find_path(LIBEVENT_INCLUDE_DIR NAMES event.h PATHS ${LibEvent_INCLUDE_PATHS} NO_DEFAULT_PATH)
find_library(LIBEVENT_LIBRARY NAMES event PATHS ${LibEvent_LIB_PATHS} NO_DEFAULT_PATH)
find_library(LIBEVENT_CORE_LIBRARY NAMES event_core PATHS ${LibEvent_LIB_PATHS} NO_DEFAULT_PATH)
find_library(LIBEVENT_PTHREADS_LIBRARY NAMES event_pthreads PATHS ${LibEvent_LIB_PATHS} NO_DEFAULT_PATH)
find_library(LIBEVENT_EXTRA_LIBRARY NAMES event_extra PATHS ${LibEvent_LIB_PATHS} NO_DEFAULT_PATH)
find_library(LIBEVENT_OPENSSL_LIBRARY NAMES event_openssl PATHS ${LibEvent_LIB_PATHS} NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibEvent DEFAULT_MSG LIBEVENT_LIBRARY LIBEVENT_INCLUDE_DIR)
find_package_handle_standard_args(LibEventPthreads DEFAULT_MSG LIBEVENT_PTHREADS_LIBRARY LIBEVENT_INCLUDE_DIR)
find_package_handle_standard_args(LibEventCore DEFAULT_MSG LIBEVENT_CORE_LIBRARY LIBEVENT_INCLUDE_DIR)
find_package_handle_standard_args(LibEventExtra DEFAULT_MSG LIBEVENT_EXTRA_LIBRARY LIBEVENT_INCLUDE_DIR)
find_package_handle_standard_args(LibEventOpenssl DEFAULT_MSG LIBEVENT_OPENSSL_LIBRARY LIBEVENT_INCLUDE_DIR)

mark_as_advanced(
    LIBEVENT_INCLUDE_DIR 
    LIBEVENT_LIBRARY 
    LIBEVENT_PTHREADS_LIBRARY 
    LIBEVENT_OPENSSL_LIBRARY 
    LIBEVENT_CORE_LIBRARY 
    LIBEVENT_EXTRA_LIBRARY
)
