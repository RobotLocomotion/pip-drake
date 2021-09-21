ExternalProject_Add(libxcrypt
    URL ${libxcrypt_url}
    URL_MD5 ${libxcrypt_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    PATCH_COMMAND ./autogen.sh
    CONFIGURE_COMMAND ./configure
        --prefix=${CMAKE_INSTALL_PREFIX}
        --enable-shared
        --enable-static
        --enable-obsolete-api
        --enable-hashes=all
        CFLAGS=-fPIC
        CXXFLAGS=-fPIC
    BUILD_COMMAND make
    INSTALL_COMMAND make install
    )

ExternalProject_Add_Step(
  libxcrypt CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/libxcrypt/LICENSING ${LICENSE_DIR}/libxcrypt/LICENSING
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/libxcrypt/COPYING.LIB ${LICENSE_DIR}/libxcrypt/COPYING.LIB
  DEPENDEES install
)