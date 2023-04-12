cmake_minimum_required(VERSION 2.8)
project(blitz)

find_package(Qt5 REQUIRED COMPONENTS Gui Widgets)

include(GNUInstallDirs)

## the following are directories where stuff will be installed to
set(BIN_INSTALL_DIR "${CMAKE_INSTALL_BINDIR}")
set(LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")

SET(CMAKE_CXX_STANDARD 11)

if (CMAKE_COMPILER_IS_GNUCXX)
   if (CMAKE_SYSTEM_NAME MATCHES Linux)
       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -ansi -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-exceptions -fno-check-new -fno-common")
       add_definitions(-DQT_NO_EXCEPTIONS)
   endif (CMAKE_SYSTEM_NAME MATCHES Linux)
endif (CMAKE_COMPILER_IS_GNUCXX)

if (WIN32)
 set(CMAKE_DEBUG_POSTFIX "d")
 set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin )
endif (WIN32)

# Set up RPATH handling, so the libs are found if they are installed to a non-standard location.
# By default cmake builds the targets with full RPATH to everything in the build directory,
# but then removes the RPATH when installing.
# These two options below make it set the RPATH of the installed targets to all
# RPATH directories outside the current CMAKE_BINARY_DIR and also the library
# install directory. Alex
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH  TRUE)
set(CMAKE_INSTALL_RPATH "${LIB_INSTALL_DIR}" )

if(APPLE)
   set(CMAKE_INSTALL_NAME_DIR ${LIB_INSTALL_DIR})
endif(APPLE)

add_subdirectory(blitz)
add_subdirectory(test)

set(ConfigPackageLocation ${CMAKE_INSTALL_LIBDIR}/cmake/QImageBlitz)

install(EXPORT QImageBlitzConfig
  NAMESPACE
    QImageBlitz::
  DESTINATION
    ${ConfigPackageLocation}
)
