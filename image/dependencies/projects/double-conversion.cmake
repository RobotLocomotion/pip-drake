ExternalProject_Add(double-conversion
    URL ${double-conversion_url}
    URL_MD5 ${double-conversion_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
    )

ExternalProject_Add_Step(
  double-conversion CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/double-conversion/COPYING ${LICENSE_DIR}/double-conversion/COPYING
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/double-conversion/LICENSE ${LICENSE_DIR}/double-conversion/LICENSE
  DEPENDEES install
)