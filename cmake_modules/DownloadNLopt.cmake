include(DownloadProject)

if (CMAKE_VERSION VERSION_LESS 3.2)
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "")
else()
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "UPDATE_DISCONNECTED 1")
endif()

set(URL_NLOPT "https://github.com/stevengj/nlopt.git" 
    CACHE STRING "Location of the nlopt git repository")

# set(NLopt_DIR ${CMAKE_BINARY_DIR}/nlopt)
include(DownloadProject)
download_project(   PROJ                nlopt
                    GIT_REPOSITORY      ${URL_NLOPT}
                    GIT_TAG             v2.5.0
                    # CMAKE_CACHE_ARGS    -DBUILD_SHARED_LIBS:BOOL=OFF -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=${NLopt_DIR}
                    ${UPDATE_DISCONNECTED_IF_AVAILABLE}
)

set(SHARED_LIBS_STATE BUILD_SHARED_LIBS)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(NLOPT_PYTHON OFF CACHE BOOL "" FORCE)
set(NLOPT_OCTAVE OFF CACHE BOOL "" FORCE)
set(NLOPT_MATLAB OFF CACHE BOOL "" FORCE)
set(NLOPT_GUILE OFF CACHE BOOL "" FORCE)
set(NLOPT_SWIG OFF CACHE BOOL "" FORCE)
set(NLOPT_LINK_PYTHON OFF CACHE BOOL "" FORCE)

add_subdirectory(${nlopt_SOURCE_DIR} ${nlopt_BINARY_DIR})

set(NLopt_LIBS nlopt)
set(NLopt_INCLUDE_DIR ${nlopt_BINARY_DIR} 
                      ${nlopt_BINARY_DIR}/src/api)
set(SHARED_LIBS_STATE ${SHARED_STATE})