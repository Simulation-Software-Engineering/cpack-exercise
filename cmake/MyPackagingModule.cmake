set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack exercise code"
 CACHE STRING "The CMake/CPack/Docker code to automatically create bundles + Debian packages with Docker as demanded in the exercise.")
 
set(CPACK_PACKAGE_VENDOR "SSE Course Participant(s)")

set(CPACK_PACKAGE_CONTACT "ngeldner3@gmail.com")
set(CPACK_PACKAGE_MAINTAINERS "Nicolas Geldner ${CPACK_PACKAGE_CONTACT}")

set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/qwach/cpack-exercise")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

include(CPack)

