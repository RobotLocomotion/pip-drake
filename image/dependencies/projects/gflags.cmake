ExternalProject_Add(gflags
    URL ${gflags_url}
    URL_MD5 ${gflags_md5}
    DOWNLOAD_NAME ${gflags_dlname}
    ${COMMON_EP_ARGS}
    ${COMMON_CMAKE_EP_ARGS}
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
    )

ExternalProject_Add_Step(
  gflags CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/gflags/COPYING.txt ${LICENSE_DIR}/gflags/COPYING.txt
  DEPENDEES install
)