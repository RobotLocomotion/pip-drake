ExternalProject_Add(png
    DEPENDS zlib
    URL ${png_url}
    URL_MD5 ${png_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DPNG_SHARED:BOOL=OFF
        -DZLIB_INCLUDE_DIR:PATH=${CMAKE_INSTALL_PREFIX}/include
        -DZLIB_LIBRARY:PATH=${CMAKE_INSTALL_PREFIX}/lib/libz.a
    )

ExternalProject_Add_Step(
  png CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/png/LICENSE ${LICENSE_DIR}/png/LICENSE
  DEPENDEES install
)