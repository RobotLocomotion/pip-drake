ExternalProject_Add(lz4
    URL ${lz4_url}
    URL_MD5 ${lz4_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND make
        BUILD_SHARED=no
        "CFLAGS=-fPIC -O3"
    INSTALL_COMMAND make
        BUILD_SHARED=no
        PREFIX=${CMAKE_INSTALL_PREFIX}
        install
    )

ExternalProject_Add_Step(
  lz4 CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/lz4/lib/LICENSE ${LICENSE_DIR}/lz4/LICENSE
  DEPENDEES install
)