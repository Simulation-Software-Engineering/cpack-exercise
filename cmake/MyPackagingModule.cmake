set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPackexample project"
  CACHE STRING "Extended summary.")

set(CPACK_PACKAGE_VENDOR "SSE Student")
set(CPACK_PACKAGE_CONTACT "st164515@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "SSE Student ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")

# Debian specific changes
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
set(CPACK_STRIP_FILES TRUE)
set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)