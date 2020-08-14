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
