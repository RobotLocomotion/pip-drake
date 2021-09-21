ExternalProject_Add(bzip2
    URL ${bzip2_url}
    URL_MD5 ${bzip2_md5}
    ${COMMON_EP_ARGS}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND make "CFLAGS=-fPIC -O2"
    INSTALL_COMMAND make PREFIX=${CMAKE_INSTALL_PREFIX} install
    )

ExternalProject_Add_Step(
  bzip2 CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/bzip2/LICENSE ${LICENSE_DIR}/bzip2/LICENSE
  DEPENDEES install
)