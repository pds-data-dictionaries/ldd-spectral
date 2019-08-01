# Spectral Dictionary ```src/``` Files

This directory contains the source files for building the various versions of the Spectral Discipline Dictionary (SP)
with the supported versions of the PDS4 core Information Model (IM). The first level of subdirectories indicates the
SP version; under each of these is a directory for each supported IM version (note that this is inverted from the 
subdirectory organization under the ```build/``` tree). So, for example, ```src/1.2.0.0/1.C.0.0``` contains the 
source file of the 1.2.0.0 version of the Spectral Dictionary, prepared for building against the 1.C.0.0 (a.k.a. "1.11.0.0")
version of the IM.

The only difference between files of the same SP version but different IM version are the references to the IM source
files in the processing instruction on line 2, and the ```xsi:schemaLocation``` hint on line 5.
