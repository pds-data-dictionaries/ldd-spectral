.. 2024-04-07, by Anne Raugh

##################################################
Introduction
##################################################

This "User's Guide" provides a brief overview of the
Spectral/Spectroscopy namespace, used to provide discipline
details for data products presenting the most common 
spectroscopic or spectrophotometric data. 

This namespace can describe data in the four most common spectral formats;
with spectral bins defined in wavelength, wave number, frequency, and energy;
and offers several options for specifying the spectral bin parameters.

This guide presents the major features of the namespace.


################################################################
Overview of the Spectral/Spectroscopy Discipline Dictionary
################################################################

.. include:: ../intro.md

- **Primary Steward:** Anne Raugh, Small Bodies Node, University of Maryland (@acraugh on Github)
- **Dictionary Repo:** https://github.com/pds-data-dictionaries/ldd-spectral
- **Namespace Prefix:** sp:

Corrections, changes, and additions should be submitted through 
the `PDS LDD Issue Repo <https://github.com/pds-data-dictionaries/PDS4-LDD-Issue-Repo>`_.

##################################################
Organization of Classes and Attributes
##################################################

The Spectral dictionary has a single top-level class called *<sp:Spectral_Characteristics>*.
Below that, there are major subclasses to describe the observational parameters, the field of
view (that is, the "slit"), and to provide the spectral bin descriptions.

The following sections describe the major subclasses of the Spectral dictionary, in the
order in which they must occur in labels.

**************************************************
Top-Level Class: <sp:Spectral_Characteristics>
**************************************************

The *<sp:Spectral_Characteristics>* class acts as a wrapper for all other Spectral classes.
It begins with a *<pds:Local_Internal_Reference>* class which is used to associate the 
spectral characteristics with the data object that contains the spectral data. This is
followed by several required and optional *sp:* attributes, and then by the major subclasses.

The sequence of elements within the *<sp:Spectral_Characteristics>* class is:

- :ref:`\<pds:Local_Internal_Reference\><local_internal_reference>`
- :ref:`<sp:description><sp_description>`
- :ref:`<sp:spectrum_format><sp_spectrum_format>`
- :ref:`<sp:value_field_name><sp_value_field_name>`
- :ref:`<sp:value_field_number_list><sp_value_field_number_list>`
- :ref:`<sp:spectral_bin_type><sp_spectral_bin_type>`
- :ref:`<sp:Observation_Parameters><observation_parameters>`
- :ref:`<sp:Field_of_View><field_of_view>`
- :ref:`<sp:Bin_Description><bin_description>`

Follow the links above to the subclass descriptions. The attribute descriptions follow.

+++++++++++++++++++++++++++++++++++++++++++++++++++++
Attributes of <sp:Spectral_Characteristics>
+++++++++++++++++++++++++++++++++++++++++++++++++++++

.. _sp_description:

<sp:description>
  This optional attribute is provided so that any circumstances of note can be included
  for the user. These notes should make sense within the context of the label. If a 
  reference to an external document is needed, that document should be included in the
  label *<pds:Reference_List>* with a comment as to why the document is being referenced.

.. _sp_spectrum_format:

<sp:spectrum_format>
  This required attribute indicates the format of the spectral data. It should agreed
  with the format listed in the label *<pds:Primary_Result_Summary>* class, which in turn should
  include *<pds:Science_Facets>* with a *<pds:discipline>* of **Spectroscopy** and a
  *<pds:facet1>* value that is consistent with one of these supported format values:
  
  **1D**
    The spectrum is a single, linear spectrum presented as a table object in which each row contains
    the information about one point (i.e., bin) in the spectrun. In this case
    *<pds:facet1>* should have a value of **Linear**.
  **2D**
    The spectrum is defined using an *Array_2D_Spectrum* object, or possible as an
    *Array_2D_Image* object. If the axes of the 
    spectrum align with the axes of the image, then the *<pds:facet1>* value should be
    **2D**; otherwise, the *<pds:facet1>* value should be **Spectral Image**
  **3D**
    The spectrum is defined using an *Array_3D_Spectrum* object, or possibly an
    *Array_3D_Image* object. In this case the value
    of *<pds:facet1>* should be **Spectral Cube**.
  **Tabulated-Flat**
    In this data structure, multiple spectra are presented in a single table, and each row
    contains a single spectrum with the spectral values, bin dimensions, and any related s
    defined as unique fields. In other words, there are no "Group_Field" structures used in
    the label. In this case all fields containing spectral data or bin data *must* have unique 
    *<pds:field_number>* attributes. In this case the *<pds:facet1>* value must be **Tabulated**.
  **Tabulated-Parameter Groups**
    In this structure, multiple spectra are presented in a single table, also with one spectrum
    per row, but in this case the "*Group_Fields*" structure is used to provide all the spectral
    data consecutively, then all the error bars, then all the bin centers, etc. For this case, 
    the *<pds:facet1>* value must be **Tabulated**.
  **Tabulated-Point Group**
    In this structure, once again each row of a table contains a single spectrum, but for this
    case a single "*Group_Field*" is defined to hold all the parameters associated with one bin,
    and this structure is repeated across the row for each bin. As with the other tabular forms,
    the *<pds:facet1>* value must be **Tabulated**.
 
*Note that the tabulated formats do not require that bin parameters be part of the table structure.
They can be specified explicitly or referenced in other data objects or products, as needed.*
    
.. _sp_value_field_name:
    
<sp:value_field_name>
  This attribute is required to be present when *<sp:spectrum_format>* is one of **1D**,
  **Tabulated-Parameter Groups**, or **Tabulated-Point Group**. (It is prohibited for other
  formats.) In these formats, the field containing the spectral values has a single field
  definition, which should contain a unique name. The value of that *<pds:name>* attribute
  is supplied here.
  
  *Note that in the names used to identify fields should be unique and devoid of problematic
  characters like '<', '>', and '&'. Alphanumerics only, for best results.*

.. _sp_value_field_number_list:

<sp:value_field_number_list>
  This attribute is required to be present when *<sp:spectrum_format>* is **Tabulated-Flat** and
  is prohibited otherwise. This is the case where each field in the row is described individually, 
  without *Group_Field* structures. This is also the case where the *Field* classes *must*
  contain unique *<pds:field_number>* values, precisely so they can be identified here. The
  value of this attribute should be a parenthesized, comma-separated list of value 
  *<pds:field_number>* values present in the associated table structure. The intention is that this list
  can be easily parsed by software, which could then extract the spectral values from the table record.
  
.. _sp_spectral_bin_type:

<sp:spectral_bin_type>
  This attribute is required to be present always. It determines the type of bins that will be
  described later in the label. It must have one of the following values:
  
    * **energy**
    * **frequency**
    * **wavelength**
    * **wavenumber**
    
.. _local_internal_reference:

**************************************************
Subclass: <pds:Local_Internal_Reference>
**************************************************

The *<pds:Local_Internal_Reference>* class is used to associate information like the spectral 
characteristics to specific data objects in the PDS4 label. To use it, you must include a
*<pds:local_identifier>* in the data structure containing your spectral data, to be referenced
here.

This class contains:

- <pds:comment>
- <pds:local_identifier_reference>
- <pds:local_reference_type>

<pds:comment>
  An optional text field for any caveats, usage notes, or other notes about the spectral
  data.
  
<pds:local_identifier_reference>
  The value of the *<pds:local_identifier>* in the data object containing the spectral data.
  The value must match exactly one local identifier in the label.
  
<pds:local_reference_type>
  This indicates the gross nature of the data object being referenced. It must be one of
  these two values:
  
    * **spectral_characteristics_to_array_object** - used when the data are in an *Array*\-type object
    * **spectral_characteristics_to_table_object** - used when the data are in a *Table*\-type object

.. _observation_parameters:

**************************************************
Subclass: <sp:Observation_Parameters>
**************************************************

The *<sp:Observation_Parameters>* class provides details relevant to the collection and calibration
of the spectrum. 

This class contains:

- <sp:number_of_exposures>
- <sp:net_integration_time>
- <sp:resolution_limit_(energy|frequency|wavelength|wavenumber>
- <sp:solar_analog_star_name>
- <sp:absolute_calibration_star_name>
- <sp:comment>

All of these attributes are optional - include the ones that are relevant. None are repeatable unless stated
otherwise in the descriptions following.

<sp:number_of_exposures>
  This attribute indicates the number of individual exposures or distinct integrations that were combined 
  to produce the spectrum in the data object. It should be present even if the value is "1". To omit this 
  attribute implies that "number of exposures" is not an applicable concept for the data presented, which 
  is not a typical situation.

<sp:net_integration_time>
  The *sp:net_integration_time* is the total actual integration time contributing to each pixel. In most 
  cases, all pixels are exposed simultaneously and this is equivalent to the net observation time. For 
  instruments that sweep across pixels, rows, or planes, though, this value will differ from the observation 
  time. It is hard to imagine a case where this concept is not applicable, but if you have such a case, 
  please include an *<sp:comment>* attribute to make that clear.

<sp:resolution_limit_(energy|frequency|wavelength|wavenumber>
  These attributes indicate the spectral resolution of the observing instrument - specifically the smallest 
  distinguishable spectral interval.
  The name of the attribute used should correspond to the *<sp:spectrum_format>* in the *<sp:Spectral_Characteristics>*
  class. So if the *spectrum_format* was **wavelength**, then *<sp:resolution_limit_wavelength>* is the version of 
  this attribute that should be supplied.
  
  If the spectral resolution is unknown, omit this attribute. 
  
<sp:solar_analog_star_name>
  The *sp:solar_analog_star_name* attribute provides a name in a standard format (i.e., one that is recognized by the 
  SIMBAD system) for the solar analog star used to reduce the raw spectral data to the reflectance units presented in 
  this spectrum. You may repeat this attribute if needed for additional stars. *Do not repeat this attribute to provide 
  alternate names for the same star.*
  
<sp:absolute_calibration_star_name>
  The *sp:absolute_calibration_star_name* attribute provides a name in a standard format (i.e., one that is 
  recognized by the SIMBAD system) for the 
  star used to reduce the raw spectral data to the (non-reflectance) units presented in this spectrum. You may 
  repeat this attribute if needed for additional stars. *Do not repeat this attribute to provide alternate names 
  for the same star.*
  
<sp:comment>
  This is an optional free-format text field to provide any additional information or caveats about attributes and 
  values in this class.

.. _field_of_view:

**************************************************
Subclass: <sp:Field_of_View>
**************************************************

The *<sp:Field_of_View>* class describes the field of view contributing to the spectral data object. This is often the 
aperture or slit used to make the observation, but may be the same as the field of view of the instrument in
some cases. 

This class contains:

- <sp:description>
- <sp:Circular_FOV>
- <sp:Rectangular_FOV>
- <sp:Complex_FOV>
- <pds:Internal_Reference>

The *sp:description* is required. All subclasses are optional individually, but note that one of the FOV subclasses must be present.

<sp:description>
  This field is required and should contain a human-friendly description of the field of view (FOV) contributing to the 
  spectral data. Sometimes this will be as simple as stating that the shape is a circle or rectangular slit. 
  In more complex cases, however, some additional detail should be provided.

<sp:Circular_FOV>
  The *<sp:Circular_FOV>* class contains a single attribute for the aperture diameter.

<sp:Rectangular_FOV>
  The *<sp:Rectangular_FOV>* class contains the angular length and width of the slit, and provides position angles for
  the orientation of the slit length with respect to celestial north and the positive pole of a target body.

<sp:Complex_FOV>
  The *<sp:Complev_FOV>* class provides repeatable length and width angles, if they seem useful, as well as position angles
  with respect to celestial north and the target positive pole. The text in the *<sp:description>* attribute should make
  it clear what relation the information here has to the actual form of the field of view/slit. In this case a
  *<pds:Internal_Reference>* leading to specific documentation covering the field of view would be an excellent addition. 

<pds:Internal_Reference>
  The *<pds:Internal_Reference>* can and should be used to provide a link to documentation that explicitly describes
  the slit (field of view) dimensions and their implications whenever the FOV is complex. 
  That document is typically part of the PDS archive for the
  mission or investigation, but might be present elsewhere in the PDS for groundbased facilities and can be referenced as
  past of another investication archive in that case.
  It can be referenced by LID alone if the slit can never change (because, for example, it is
  in a spacecraft we won't be handing again). The *<pds:reference_type>* value to use here is **spectral_characteristics_to_document**.

.. _bin_description:

**************************************************
Subclass: <sp:Bin_Description>
**************************************************

Bins - their centers and widths - can be described in a number of ways. This class is all about providing those 
various options. It contains a number of parallel classes that have identical structure but require units of
measure that match the *<sp:spectrum_format>* of the *<sp:Spectral_Characteristics>* class.

This class contains:

- <sp:bin_profile_description>
- <sp:Uniformly_Sampled_(Energy|Frequency|Wavelength|Wavenumber)>
- <sp:Axis_Bin_Set_(Energy|Frequency|Wavelength|Wavenumber)>
- <sp:Spectral_Lookup>

If the spectral bins are associated with specific filters, use one of the *sp:Axis_Bin_Set* classes. 
These include an option to identify an associated filter. 

<sp:bin_profile_description>
  This free-text field is **required**. It must contain a human-friendly description of how the bin
  widths were determined. Sometimes this will be a simple statement along the lines of "That's how 
  they were designed". At other times, this may describe how "width" is locally defined for bins in
  which the "center wavelength" is not actually in the center of the bin.

  Be particularly clear about information that a user might need to know to effectively use or
  re-use the data. 

<sp:Uniformly_Sampled_(Energy|Frequency|Wavelength|Wavenumber)>
  This class is similar to other *Uniformly_Sampled* classes in the *pds:* namespace. 
  It requires a starting bin-center value, number of bins, and constant bin width, and enables a program
  to calculate the center value of each successive bin. It begins with a required *<sp:axis_name>* attribute. 
  For array-type data objects, the value of *sp:axis_name* must
  be the same as that of a *<pds:axis_name>* in the spectral array. For a spectrum of type **1D**,
  this must contain the word *"Row"*. For any **Tabulated** spectra, this must contain the word *"Field"*.

  Use the *sp:Uniformaly_Sampled* class that corresponds to the type of units of measure for the spectrum,
  as indicated by *<sp:spectral_bin_type>* in the top-level *<sp:Spectral_Characteristics>* class. 
  
  If the bin widths are unknown, the *sp:bin_width* attribute in these classes is nillable.

<sp:Axis_Bin_Set_(Energy|Frequency|Wavelength|Wavenumber)>
  The *<sp:Axis_Bin_set>* classes are used to identify the spectral dimension in the data object, and
  then provide explicit bin center and width information for each bin in that dimension. As with the
  *sp:Uniformly_Sampled* classes, the first attribute is *<sp:axis_name>*, which must correspond to
  an *<pds:axis_name>* value if the spectrum is stored in an array, *"Row"* if the spectrum is in **1D** 
  format, and *"Field"* if the spectra are in **Tabulated** format.
  
  Use the *sp:Axis_Bin_Set* class that corresponds to the type of units of measure for the spectrum,
  as indicated by *<sp:spectral_bin_type>* in the top-level *<sp:Spectral_Characteristics>* class.
  
  The *sp:Bin_Wdith* subclasses in these classes include an option to identify a filter that 
  corresponds to the bin. If the bin widths are unknown, the *sp:bin_width* attribute in these classes 
  is nillable.

<sp:Spectral_Lookup>
  The *<sp:Spectral_Lookup>* class is used when the bin centers and widths are in either another data 
  object in the same file/data product, or in a different data product elsewhere in the PDS archive. 
  It can also be
  used to specify a constant bin width rather than a look-up location for bin widths.
  
  Bin widths and centers can be looked up by:
  
  - Field name, in the case of **1D**, **Tabulated-Parameter Group**, and **Tabulated-Point Group** spectra;
  - Field number list, in the case of **Tabulated-Flat** spectra;
  - *<pds:Local_Internal_Reference>*, when the information is in another data object in the same file; or
  - *<pds:Internal_Reference>*, when the information is in another data product in the PDS.
  
  In addition, the *sp:Bin_Width_Constant* class can be used to provide a known constant bin width, or to
  declare that the bin widths are not known (that is to say, the bin width attributes are nillable).
