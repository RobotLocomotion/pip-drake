ExternalProject_Add(xz
    URL ${xz_url}
    URL_MD5 ${xz_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ./configure
        --prefix=${CMAKE_INSTALL_PREFIX}
        --disable-shared
        CFLAGS=-fPIC
        CXXFLAGS=-fPIC
    BUILD_COMMAND make
    INSTALL_COMMAND make install
    )

ExternalProject_Add_Step(
  xz CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/xz/COPYING ${LICENSE_DIR}/xz/COPYING
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/xz/COPYING.GPLv2 ${LICENSE_DIR}/xz/COPYING.GPLv2
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/xz/COPYING.GPLv3 ${LICENSE_DIR}/xz/COPYING.GPLv3
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/xz/COPYING.LGPLv2.1 ${LICENSE_DIR}/xz/LICENSE.LGPLv2.1
  DEPENDEES install
)