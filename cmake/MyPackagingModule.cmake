set(CPACK_PACKAGE_NAME ${PROJECT_NAME}) # package name

# maintainer, vendor and contact info
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Kim Kroener")                        # maintainer
set(CPACK_PACKAGE_CONTACT "Kim Kroener <st148793@stud.uni-stuttgart.de>") # contact address
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io/homepage/") # hompage
set(CPACK_PACKAGE_VENDOR "SSE lecturers")                                 # vendor

# description
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack example"                 # project description
CACHE STRING "This is a cpack exercise for the lecture Simulation Software Engineering lecture at the University of Stuttgart.") 

# version
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})                 # version number
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# clean up code
set(CPACK_STRIP_FILE TRUE) # strip files

# debian package name
#set(CPACK_DEBIAN_PACKAGE_NAME ${PROJECT_NAME})
#set(CPACK_DEBIAN_PACKAGE_VERSION ${SPECIAL_DEBIAN_VERSION})
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

# package generators
set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)





