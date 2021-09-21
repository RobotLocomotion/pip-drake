ExternalProject_Add(nlopt
    URL ${nlopt_url}
    URL_MD5 ${nlopt_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
    )

ExternalProject_Add_Step(
  nlopt CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/nlopt/COPYING ${LICENSE_DIR}/nlopt/COPYING
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/nlopt/COPYRIGHT ${LICENSE_DIR}/nlopt/COPYRIGHT
  DEPENDEES install
)