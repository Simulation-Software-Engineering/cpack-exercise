cmake_minimum_required(VERSION "3.15")

FIND_PACKAGE(deal.II 9.1.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

project("cpackexample" VERSION 0.2.0)

find_package(Boost
  1.65.1
  REQUIRED
  filesystem
  )

find_package(yaml-cpp
  0.6.0
  REQUIRED
  )
# Add yamlcpp include dirs
# include_directories(${YAMLCPP_INCLUDE_DIRS})

add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

add_executable("${PROJECT_NAME}" main.cpp)
target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

# CPack exercise additions
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR})

 set_target_properties(cpackexamplelib
   PROPERTIES PUBLIC_HEADER "fem/fem.hpp;filesystem/filesystem.hpp;flatset/flatset.hpp;yamlParser/yamlParser.hpp"
   )

target_include_directories(cpackexamplelib
    PRIVATE
        # where the library itself will look for its internal headers
	${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}
    PUBLIC
        # where top-level project will look for the library's public headers
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}>
        # where external projects will look for the library's public headers        
	$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}>
)

include(GNUInstallDirs)
install(TARGETS "${PROJECT_NAME}" cpackexamplelib
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  )
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(MyPackagingModule)

