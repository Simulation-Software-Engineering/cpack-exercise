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
  
include_directories("${YAML_CPP_INCLUDE_DIR}")

add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

add_executable("${PROJECT_NAME}" main.cpp)
target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

set_target_properties(cpackexamplelib PROPERTIES PUBLIC_HEADER "fem/fem.hpp;filesystem/filesystem.hpp;flatset/flatset.hpp;yamlParser/yamlParser.hpp")

target_include_directories(cpackexamplelib
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}>
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME} cpackexamplelib
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  )
  
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(MyPackagingModule)
