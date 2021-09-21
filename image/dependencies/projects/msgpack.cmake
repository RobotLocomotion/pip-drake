ExternalProject_Add(msgpack
    URL ${msgpack_url}
    URL_MD5 ${msgpack_md5}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
)

ExternalProject_Add_Step(
  msgpack CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/msgpack/LICENSE_1_0.txt ${LICENSE_DIR}/msgpack/LICENSE_1_0.txt
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/msgpack/COPYING ${LICENSE_DIR}/msgpack/COPYING
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/msgpack/NOTICE ${LICENSE_DIR}/msgpack/NOTICE
  DEPENDEES install
)