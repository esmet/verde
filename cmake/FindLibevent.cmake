list(APPEND Libevent_INCLUDE_PATHS "$ENV{HOME}/include")
list(APPEND Libevent_LIB_PATHS "$ENV{HOME}/lib")

find_path(LIBEVENT_INCLUDE_DIR event.h PATHS ${Libevent_INCLUDE_PATHS})
find_library(LIBEVENT_LIBRARY NAMES event PATHS ${Libevent_LIB_PATHS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libevent DEFAULT_MSG LIBEVENT_LIBRARY LIBEVENT_INCLUDE_DIR)

mark_as_advanced(LIBEVENT_INCLUDE_DIR LIBEVENT_LIBRARY)
