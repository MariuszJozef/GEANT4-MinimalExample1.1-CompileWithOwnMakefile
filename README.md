# GEANT4-MinimalExample0-CompileWithOwnMakefile
Instead of CMake (as used in the GEANT4 installation guide) you may prefer to use a Makefile. 

1. Step into the direcory where the file with main() function resides. (In MinimalExample1 that directory is main/ and the file is Geant4-MinimalWorkingExample1.cpp).

2. Create a separate directory called obj for object files:

   mkdir obj

3. At the command prompt:

   make
   
   Or:
   
   make clean all

4. Execute:

   ./Geant4-MinimalWorkingExample1

This should suffice for compilation and execution but of course you would nevertheless want to use an IDE to write and debug code.
