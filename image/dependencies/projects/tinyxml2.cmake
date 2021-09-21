ExternalProject_Add(tinyxml2
  URL ${tinyxml2_url}
  URL_MD5 ${tinyxml2_md5}
  DOWNLOAD_NAME ${tinyxml2_dlname}
  ${COMMON_EP_ARGS}
  ${COMMON_CMAKE_EP_ARGS}
  CMAKE_ARGS
    ${COMMON_CMAKE_ARGS}
)

# TODO: tinyxml2's LICENSE file is introduced in 7.1.0. We are using 7.0.1.
#ExternalProject_Add_Step(
#  tinyxml2 CopyLicense
#  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/tinyxml2/LICENSE.txt ${LICENSE_DIR}/tinyxml2/LICENSE.txt
#  DEPENDEES install
#)