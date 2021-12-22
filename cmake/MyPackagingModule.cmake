# Set common CPack variables
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack example"
CACHE STRING "This exercise is about packaging code with CPack.")
set(CPACK_PACKAGE_VENDOR "SSE Lecturers / Student")
set(CPACK_PACKAGE_CONTACT "Chin-Han Lai <st174369@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/")


set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# Debian specific changes
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

# Set strip files
set(CPACK_STRIP_FILES TRUE)

# Define cpack generator
set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)