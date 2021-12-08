set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

# step 2
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack Exercise description example"
  CACHE STRING "Extended summary.")
set(CPACK_PACKAGE_VENDOR "SSE Lecturers / Employer")
set(CPACK_PACKAGE_CONTACT "chalapai@example.com")
set(CPACK_PACKAGE_MAINTAINER "See attendee ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")

# version
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# export packaging options (step 3)
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_STRIP_FILES TRUE)

# debian specific (step 4)
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

include(CPack)
