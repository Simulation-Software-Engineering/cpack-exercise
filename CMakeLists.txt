cmake_minimum_required(VERSION "3.12")

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

add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

set_target_properties(cpackexamplelib PROPERTIES PUBLIC_HEADER "filesystem/filesystem.hpp;fem/fem.hpp;flatset/flatset.hpp;yamlParser/yamlParser.hpp")

# Set up library includes
target_include_directories(cpackexamplelib
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/cpackexamplelib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cpackexamplelib>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib>
)

add_executable("${PROJECT_NAME}" main.cpp)
target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

include(GNUInstallDirs)
install(TARGETS cpackexample cpackexamplelib
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  )


# Packaging section
# Adding other cmake modules
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
# Include our packaging module
include(Packaging)
