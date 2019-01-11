# Pangolin requires CMake 3.12
cmake_minimum_required(VERSION 3.12)

# Pangolin uses Hunter, so we'll require it here
include("cmake/HunterGate.cmake")

# LOCAL specifies that cmake/Hunter/config.cmake controls our pagacke versions and sources
# That file specifies that pangolin should be loaded from the git submodule in this repository
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.55.tar.gz"
    SHA1 "da31d97da47cdde05f958786b6729ba9b773bb17"
    LOCAL
)

project(PangolinExample LANGUAGES C CXX CUDA VERSION 0.1.0)

# Use hunter to add the pangolin package
#hunter_add_package(pangolin)

# add our example as an executable
add_executable(example src/example.cpp)


# add pangolin targets
add_subdirectory("thirdparty/pangolin")

# link against the 32-bit pangolin library
target_link_libraries(example pangolin::pangolin32)