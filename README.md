# Pangolin Example

This is an example C++ project that uses CMake to link against the Pangolin(github.com/c3sr/pangolin) library.
There are two styles of using Pangolin.

* The first is to include the pangolin source code in your project (whether through a git submodule or otherwise), and use the CMake `add_subdirectory()` function to add the Pangolin targets to your build.
* The second is to install Pangolin separately, and use the CMake `find_package(pangolin CONFIG REQUIRED)` facility along with `-DCMAKE_PREFIX_PATH` to tell your code where Pangolin's headers and libraries are.

## Prerequisites

Pangolin requires CMake 3.13+

```bash
cmake --version
```

Follow instructions on the [CMake website](cmake.org) to install CMake 3.13+.

## Building from source (add_subdirectory method)

```bash
git clone git@github.com:c3sr/pangolin_example.git --recursive 
```

if you don't use git with SSH, you could do

```bash
git clone https://github.com/c3sr/pangolin_example.git --recursive 
```

```bash
cd pangolin_example
mkdir build && cd build
cmake ..
make
```

## Building from source (find_package method)

First, clone and install pangolin

```bash
git clone git@github.com:c3sr/pangolin.git --recursive 
```

if you don't use git with SSH, you could do

```bash
git clone https://github.com/c3sr/pangolin.git --recursive 
```

cd pangolin
git checkout 0fcbf061d06bb34e0912dfd2016e62f92593d955
cd ..
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/tmp/pangolin
make install
```

Then, configure the example code with the install location of pangolin


```bash
git clone git@github.com:c3sr/pangolin_example.git 
mkdir build
cmake .. -DEXTERNAL_PANGOLIN=ON -DCMAKE_PREFIX_PATH=/tmp/pangolin
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

        git submodule add git@github.com:c3sr/pangolin.git thirdparty/pangolin
        cd thirdparty/pangolin
        git checkout develop
        cd -
        git add thirdparty/pangolin
        git commit -m "Add thirdparty/pangolin at current develop"