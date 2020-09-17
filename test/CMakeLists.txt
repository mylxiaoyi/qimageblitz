project(blitztest_qt5)

if (WIN32)
 set(CMAKE_DEBUG_POSTFIX "d")
endif (WIN32)

include_directories(
${CMAKE_SOURCE_DIR}
${blitztest_BINARY_DIR}
${blitz_lib_SOURCE_DIR}
${Qt5Widgets_INCLUDE_DIRS}
)

set(GUI_SOURCE_FILES
    main.cpp
    mainwindow.cpp
    scaledialog.cpp
)

set(GUI_HEADER_FILES
    mainwindow.h
)

QT5_WRAP_CPP(GUI_HEADER_FILES_HPP ${GUI_HEADER_FILES})

if(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
  cmake_policy(SET CMP0028 NEW)
endif(COMMAND cmake_policy) 

add_executable(blitztest_qt5 ${GUI_SOURCE_FILES} ${GUI_HEADER_FILES_HPP})

target_link_libraries(blitztest_qt5 ${Qt5Widgets_LIBRARIES} q5imageblitz)

install(TARGETS blitztest_qt5 DESTINATION ${BIN_INSTALL_DIR})

