# Spectral Discipline Namespace Change Log

## Changes from v1.3.1.0 to 1.3.1.1

These changes should be transparent to users creating labels with the Spectral Discipline
classes.

### Recoding for issue #52

Replaced the "pds." syntax-kludge notation for referencing the _pds:_ namespace with
the _DD_Associate_External_Class_ class, which providef a mechanism for defining 
reference type values as the external reference is made.  These superseded both the
corresponding _DD_Associate_ classes and the _DD_Rule_ Schematron rule classes 
needed to define the permissible values in each context.

The _IngestLDD_ file annotations were updated accordingly, and the old syntax was
left in comments for reference by stewards who may be updating existing namespaces
and want some guidance.

## Changes from v1.3.0.0 to 1.3.1.0

### Bugfix for issue #154

A user reported (PDS4-LDD-Issue-Repo issue #154) that the Schematron validation was 
reporting an error from the <pds:local_reference_type> when the table pointed to was
a Table_Delimited object. This was an oversight - support for Table_Delimited _was_ 
included in the rewrite. The bug is now fixed and one of the test cases in the
second test label has been converted to a Table_Delimited to exercise this option.

### General Clean-up

* Unneeded files were deleted from the _test/_ directory
* Updated error documentation in _test/SP-Test2-FAIL.xml_ 
* Updated main _README_ for new repo configuration
* Updated directory _READMEs_ as needed

## Changes from v1.2.0.0 to 1.3.0.0

### Added support for energy spectra

Spectral bin type can now be described as "energy" for spectra having bins defined in eV. 
All spectral-type attributes (like the <bin_width_\*>) now have an "energy" alternative,
(e.g., <bin_width_energy>).  Regression test files were updated with a class to exercise the new
bin type.

Note that energy spectral units require the presence of the *Units_of_Energy* unit class,
which was only introduced in IM build 1.13.0.0 (1D00 schemas). Therefore, this version of the
**Spectral Discipline Dictionary** cannot be back-ported to IM versions earlier than 1.13.0.0.

### Change Log move

This change log was moved out of the *src/* tree up to the root of the repo, and renamed from 
"README.md" to "ChangeLog.md".

### Fixed internal compliance issue with optional and nillable attributes

In keeping with PDS LDD design best practices, attribute that were defined as "nillable" but
no longer *required* to be present in any class had the nillable option removed from their 
definitions. This should be transparent to users.

### Added license info

The Apache 2.0 license has been added to the repo

---
## Changes from v1.1.0.0 to v1.2.0.0

### <Uniformly_Sampled> Table Support

Upgraded support for tables in the <Uniformly_Sampled> class by recognizing two special values 
of <axis_name>: **Row**, for use with uniformly sampled spectral tables (where each row is a 
single bin of the spectrum); and **Field**, for use with tabulated spectra (where each row is
an entire spectrum and the bins are in successive columns).

### <Uniformly_Sampled>/<axis_name> now required

The <axis_name> attribute of the <Uniformly_Sampled> class is now required in all cases. Formerly
it was required for arrays, but assumed to be equivalent to the new **Row** value for all tables.

### Added Table Support to <Axis_Bin_Set>

The <axis_name> attribute in <Axis_Bin_Set> also recognizes the special values **Row** and **Field**
for use with table spectra.  This class may now be used to explicitly define bins for spectral 
tables and tabulated specta.
### Moved <Bin_Width_Constant> class

The <Bin_Width_Constant> class was moved under the <Spectral_Lookup> class to serve as an alternate
means of determining bin widths where a lookup is not available.  All other cases provide a "constant"
alternative already, and the class was unusable as originally implemented, since all other classes
define bin centers and widths concurrently.

### <bin_width_*> is nillable

The various unit-specific instances of <bin_width_*> have all been made nillable, to cover the
case where bin width is not known. Note that, because of a quirk of the implementation, units
must still be specified.  So, for example, to declare that a wavelength spectrum has unknown
bin widths, use this construct:

     <bin_width_wavelength unit="nm" xsi:nil="true" nilReason="unknown"/>
     
### Removed <original_bin_number>

This attribute was a carry-over from PDS3, where it appears to have been added to the dictionary
for the support of a single atypical mission instrument.  It has been removed.

### Updated Test Labels

The test labels have been updated to include test cases for use of <Uniformly_Sampled> and 
<Axis_Bin_Set> with tabular data, and nil bin widths.
