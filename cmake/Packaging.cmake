# CPack section
## set variables
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "SSE Lecturers / Employer")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack example"
CACHE STRING "CPack exercise for the lecture Simulation Software Engineering WS2021/22 at the University of Stuttgart.")
set(CPACK_PACKAGE_CONTACT "Magnus Ostertag <MagnusOstertag@users.noreply.github.com>")
set(CPACK_PACKAGE_MAINTAINER "Magnus Ostertag")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# strip debugging
set(CPACK_STRIP_FILES TRUE)

set(CPACK_GENERATOR "TGZ;DEB")

# debian naming scheme
set(CPACK_DEBIAN_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_DEBIAN_PACKAGE_VERSION ${SPECIAL_DEBIAN_VERSION})
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

## include CPack
include(CPack)
