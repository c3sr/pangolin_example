# Pangolin Example

This is an example C++ project that uses CMake to link against the Pangolin(github.com/c3sr/graph_challenge) library.
There are two styles of using Pangolin.

* The first is to include the pangolin source code in your project, and use the CMake `add_subdirectory()` function to add the Pangolin targets to your build.
* The second is to install Pangolin separately, and use the CMake `find_package(pangolin CONFIG REQUIRED)` facility along with `-CMAKE_MODULE_PATH` to tell your code where Pangolin's headers and libraries are.

## Building from source (add_subdirectory method)

```bash
git clone --recursive git@github.com:c3sr/pangolin_example.git 
mkdir build
cmake ..
make
```

## Building from source (find_package method)

First, clone and install pangolin (at a known-good commit, for the sake of example)

```bash
git clone --recursive git@github.com:c3sr/graph_challenge.git
```

if you don't use git with SSH, you could do

```bash
git clone --recursive https://github.com/c3sr/pangolin_example.git
```

cd graph_challenge
git checkout 6a8c59ac5e5854e2971be91911720daed7f70d17
cd ..
cmake .. -DCMAKE_INSTALL_PREFIX=/tmp/pangolin
make install
```

Then, configure the example code with the install location of pangolin


```bash
git clone git@github.com:c3sr/pangolin_example.git 
mkdir build
cmake .. -DEXTERNAL_PANGOLIN=ON -DCMAKE_MODULE_PATH=/tmp/pangolin
make
```

Clean up `/tmp/pangolin` when you are done (if you want)

```bash
rm -r /tmp/pangolin
```

## If you cloned without --recursive

Run the following commands

```bash
git submodule update --init --remote
```


## How this example was created

1. Create a new repository
2. Add pangolin as a submodule

        mkdir -p thirdparty/pangolin
        git submodule add git@github.com:c3sr/graph_challenge.git thirdparty/pangolin
        cd thirdparty/pangolin
        git checkout develop
        cd -
        git add thirdparty/pangolin
        git commit -m "Add thirdparty/pangolin at current develop"