#!/bin/sh

if [ ! -d build.release ] ; then 
    mkdir build.release
fi

cd build.release
cmake -DCMAKE_BUILD_TYPE=Release ../ 
cmake --build . --target install

if [ "$(uname)" == "Darwin" ] ; then 
    cd ./../../install/mac-clang-x86_64/bin/
else
    cd ./../../install/linux-gcc-x86_64/bin/
fi

./test_fec
