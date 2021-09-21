ExternalProject_Add(lapack
    URL ${lapack_url}
    URL_MD5 ${lapack_md5}
    DOWNLOAD_NAME ${lapack_dlname}
    ${COMMON_EP_ARGS}
    CMAKE_GENERATOR "Unix Makefiles"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCBLAS=ON
)

ExternalProject_Add_Step(
  lapack CopyLicense
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/lapack/LICENSE ${LICENSE_DIR}/lapack/LICENSE
  DEPENDEES install
)