# Pangolin Example

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

## Building the Example

```bash
$ git version
git version 2.17.1
```

Run the following commands

```bash
git clone --recursive git@github.com:c3sr/pangolin_example.git 
mkdir build
cmake ..
make
```
## If you cloned without --recursive

```bash
$ git version
git version 2.17.1
```

Run the following commands

```bash
git submodule update --init --remote
```