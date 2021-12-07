set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack exercise"
  CACHE STRING "This exercise is about packaging code with CPack. We work with a simplified version of the code from the previous week's exercise and create packages for it.")

set(CPACK_PACKAGE_VENDOR "SSE lecturers")

set(CPACK_PACKAGE_CONTACT "Larissa Brencher <larissa.brencher@gmail.com>")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Larissa Brencher <larissa.brencher@gmail.com>")

# ensure that compiled code gets stripped
set(CPACK_STRIP_FILES TRUE)

set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# set up package generators for debian and tar.gz
# debian settings
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
# tar.gz and deb generator
set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)
