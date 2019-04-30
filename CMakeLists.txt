# Pangolin requires CMake 3.13
cmake_minimum_required(VERSION 3.13)

option(EXTERNAL_PANGOLIN ON "Use external Pangolin (with -DCMAKE_PREFIX_PATH)")

# Pangolin uses Hunter, so we'll require it here
include("cmake/HunterGate.cmake")

# LOCAL specifies that cmake/Hunter/config.cmake controls our pagacke versions and sources
# That file specifies that pangolin should be loaded from the git submodule in this repository
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.164.tar.gz"
    SHA1 "7bcf092561389dbd70edb3fc228126ae4605e10c"
    LOCAL
)




project(PangolinExample LANGUAGES CXX CUDA VERSION 0.1.1)
hunter_add_package(spdlog)
hunter_add_package(Catch)
hunter_add_package(cub)


# add our example as an executable
add_executable(example src/example.cu)


# add pangolin targets
if (EXTERNAL_PANGOLIN)
    find_package(pangolin CONFIG REQUIRED)
else()
    add_subdirectory("thirdparty/pangolin")
endif()

target_link_libraries(example pangolin::pangolin)
