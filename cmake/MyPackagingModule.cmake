set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "SSE Lecturer / Students")
# set(CPACK_PACKAGE_DIRECTORY "cpack") # gives trouble, so remove it!
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_DESCRIPTION "SSE CPack example" CACHE STRING "A small example to extend the SSE cmake-exercise so that the result can be packaged via CPack. You get the packed archive here.")
set(CPACK_PACKAGE_CONTACT "Axel Schumacher <st155683@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_MAINTAINER "Axel Schumacher")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")
set(CPACK_STRIP_FILES TRUE)
set(CPACK_GENERATOR "TGZ;DEB")

# Settings for Debian
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

include(CPack)

