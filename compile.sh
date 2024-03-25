#/usr/bin/bash

## create clean build directory
rm -r build;
mkdir build;
cd build;

## build iostream
clang++ -std=c++20 -stdlib=libc++ -x c++-system-header iostream --precompile -o iostream.pcm

## build Point module. Does not depend on iostream
clang++ -std=c++20 -x c++-module ../Point/Point.ixx --precompile -o Point.pcm

## build line module. Depends on iostream and Point modules
clang++ -std=c++20 -x c++-module ../Line/Line.ixx --precompile -o Line.pcm -fmodule-file=Point=Point.pcm -fmodule-file=iostream.pcm

## convert Point.pcm to Point.o
clang++ -std=c++20 Point.pcm -c -o Point.o

## convert Line.pcm to Line.o
clang++ -std=c++20 Line.pcm -c -o Line.o -fmodule-file=Point=Point.pcm

## build main file into object file
clang++ -std=c++20 ../ModuleTest.cpp -c -o ModuleTest.o -fmodule-file=Line=Line.pcm -fmodule-file=Point=Point.pcm

## combine all the object files into binary 
clang++ -std=c++20 ModuleTest.o Point.o Line.o -o ModuleTest.exe

## move out of build directory
cd -- ;
