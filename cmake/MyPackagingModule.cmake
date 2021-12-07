set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack exercise" CACHE STRING "This is a simple package created as part of the SSE lecture at the University of Stuttgart in the winter term 21/22. Its main objective is to get familiar with CPack.")
set(CPACK_PACKAGE_VENDOR "Jonathan Haag")
set(CPACK_PACKAGE_CONTACT "Jonathan Haag <st157676@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_MAINTAINER "Jonathan Haag")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_STRIP_FILES TRUE)
set(CPACK_GENERATOR "TGZ;DEB")

#Debian specific changes
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
SET(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

include(CPack)