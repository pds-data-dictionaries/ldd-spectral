# Spectral Dictionary ```build/``` Files

This directory contains the files resulting from building and testing the Spectral Discipline Dictionary 
for various versions of the PDS4 Information Model (IM).  The first level of subdirectories indicates the
IM version; under each of these directories there is a subdirectory for each supported version of the 
Spectral Dictionary.  So, for example, ```build/1.B.0.0/1.2.0.0/``` contains the files related to the 
1.2.0.0 version of the Spectral Dictionary, built against the 1.B.0.0 (a.k.a. "1.11.0.0") version of the IM.
These will be referred to as the "*IM/SP*" directories collectively and generally.

In each *IM/SP* directory, you will find:

* The Schematron file (*PDS4_SP_\*.sch*), needed for using Spectral Dictionary classes in PDS4 labels 
* The XSD Schema file (*PDS4_SP_\*.xsd*), needed for using Spectral Dictionary classes in PDS4 labels
* The XML label for the above two files (*PDS4_SP_\*.xml*)
* The ```Test/``` subdirectory

The files were produced by running the specific IM-build version of LDDTool on the corresponding source
file in the ```../src/``` tree with this command line:

    % lddtool -lps <SpectraLDD_*>
    
Only the *\*.sch* and *\*.xsd* files are needed on your local system to use the Spectral Dictionary in
designing, creating, and validating product labels.

## ```Test/``` Subdirectory

The ```Test/``` directory contains files used to perform regression testing of the Spectral Dictionary:
              
> **NOTE:** The "valid" test labels do not attempt to show anything like a real-world use of the 
>           Spectral Dictionary classes.  They are "valid" only insofar as they meet the structural
>           requirements and content restrictions that are laid out in the Spectral Dictionary. ***Do NOT
>           attempt to use these as templates for real data without understanding the proper application
>           of the Spectral Dictionary metadata.***
          
* *No.Data* - A zero-length file used to satisfy the *Validate* tool requirement that a data file be
              present. (No data validation is done for data objects relevant to the Spectral Dictionary
              classes.)
* *SP-Test1-VALID.xml* and *SP-Test2-VALID.xml* - Two test labels that should show no validation errors
* *SP-Test1-FAIL.xml* and *SP-Test2-FAIL.xml* - Two test labels identical to the corresponding *VALID*
              labels, except with specific, documented errors to demonstrate proper behavior of key
              Spectral class features
* *val.config* - The configuration file passed to *Validate* to run validation on all four labels
* *validate.rpt* - The report produced by *Validate* showing the expected validation success and failure
              messages.
              
The command used to produce the validation report (running inside the ```Test/``` directory) was:

      % validate -config val.config
      
The version of *Validate* used, which affects which versions of the IM are available for validation within
the tool, is listed at the top of *validate.rpt*.
