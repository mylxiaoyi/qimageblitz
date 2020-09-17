prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=@CMAKE_INSTALL_PREFIX@
libdir=@LIB_INSTALL_DIR@
includedir=@CMAKE_INSTALL_PREFIX@/include/q5imageblitz

Name: Blitz
Description: Blitz image effect and filter library
Version: @BLITZ_LIB_VERSION_STRING@
Requires: Qt5Gui
Libs: -L${libdir} -lq5imageblitz
Cflags: -I${includedir}
