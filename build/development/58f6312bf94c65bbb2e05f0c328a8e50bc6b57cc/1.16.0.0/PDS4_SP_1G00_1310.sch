<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:sp  Version:1.3.1.0 - Tue Jun 22 19:26:48 UTC 2021 -->
  <!-- Generated from the PDS4 Information Model Version 1.16.0.0 - System Build 11.1 -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/sp/v1" prefix="sp"/>

		   <!-- ================================================ -->
		   <!-- NOTE:  There are two types of schematron rules.  -->
		   <!--        One type includes rules written for       -->
		   <!--        specific situations. The other type are   -->
		   <!--        generated to validate enumerated value    -->
		   <!--        lists. These two types of rules have been -->
		   <!--        merged together in the rules below.       -->
		   <!-- ================================================ -->
  <sch:pattern>
    <sch:rule context="sp:Axis_Bin_Set_Energy">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="arrayid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:assert test="$spectype = ('energy')">
        <title>abs_energy_check/Rule</title>
        The sp:Axis_Bin_Set_Energy class may only be used when sp:spectral_bin_type is "energy".</sch:assert>
      <sch:assert test="((//parent::node()[pds:local_identifier=$arrayid]/pds:Axis_Array/pds:axis_name=sp:axis_name) or (sp:axis_name=('Row','Field')))">
        <title>abs_energy_check/Rule</title>
        In the Axis_Bin_Set classes, the sp:axis_name value must correspond to the name of an axis in the referenced array object, or contain one of the special values "Row" or "Field".</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Axis_Bin_Set_Frequency">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="arrayid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:assert test="$spectype = ('frequency')">
        <title>abs_frequency_check/Rule</title>
        The sp:Axis_Bin_Set_Frequency class may only be used when sp:spectral_bin_type is "frequency".</sch:assert>
      <sch:assert test="((//parent::node()[pds:local_identifier=$arrayid]/pds:Axis_Array/pds:axis_name=sp:axis_name) or (sp:axis_name=('Row','Field')))">
        <title>abs_frequency_check/Rule</title>
        In the Axis_Bin_Set classes, the sp:axis_name value must correspond to the name of an axis in the referenced array object, or contain one of the special values "Row" or "Field".</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Axis_Bin_Set_Wavelength">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="arrayid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:assert test="$spectype = ('wavelength')">
        <title>abs_wavelength_check/Rule</title>
        The sp:Axis_Bin_Set_Wavelength class may only be used when sp:spectral_bin_type is "wavelength".</sch:assert>
      <sch:assert test="((//parent::node()[pds:local_identifier=$arrayid]/pds:Axis_Array/pds:axis_name=sp:axis_name) or (sp:axis_name=('Row','Field')))">
        <title>abs_wavelength_check/Rule</title>
        In the Axis_Bin_Set classes, the sp:axis_name value must correspond to the name of an axis in the referenced array object, or contain one of the special values "Row" or "Field".</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Axis_Bin_Set_Wavenumber">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="arrayid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="binnum" value="count(sp:Bin_Wavenumber)"/>
      <sch:let name="uniqueseq" value="count(distinct-values(sp:Bin_Wavenumber/sp:bin_sequence_number))"/>
      <sch:assert test="$spectype = ('wavenumber')">
        <title>abs_wavenumber_check/Rule</title>
        The sp:Axis_Bin_Set_Wavenumber class may only be used when sp:spectral_bin_type is "wavenumber".</sch:assert>
      <sch:assert test="((//parent::node()[pds:local_identifier=$arrayid]/pds:Axis_Array/pds:axis_name=sp:axis_name) or (sp:axis_name=('Row','Field')))">
        <title>abs_wavenumber_check/Rule</title>
        In the Axis_Bin_Set classes, the sp:axis_name value must correspond to the name of an axis in the referenced array object, or contain one of the special values "Row" or "Field".</sch:assert>
      <sch:assert test="$binnum eq $uniqueseq">
        <title>abs_wavenumber_check/Rule</title>
        In the Axis_Bin_Set class, the bin_sequence_number of each Bin_Wavenumber class must be unique.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Center_Lookup">
      <sch:assert test="count(*) = 1">
        <title>bcl_content/Rule</title>
        In sp:Bin_Center_Lookup, exactly one of sp:bin_center_field_name, pds:Local_Identifier_Reference, or pds:Internal_Reference must be provided.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Center_Lookup/sp:bin_center_field_name">
      <sch:let name="cntfield" value="string(node())"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="specform" value="string(ancestor::sp:Spectral_Characteristics/sp:spectrum_format)"/>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly Field_Character in the referenced Table_Character object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Group_Field_Character/pds:Field_Character/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly one Field_Character inside a Group_Field_Character for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly one Field_Binary in the referenced Table_Binary object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Group_Field_Binary/pds:Field_Binary/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly one Field_Binary inside a Group_Field_Binary for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly one Field_Delimited in the referenced Table_Delimited object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype='Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Group_Field_Delimited/pds:Field_Delimited/pds:name[data(.)=$cntfield]) eq 1) else true()">
        <title>bcl_field/Rule</title>
        The sp:bin_center_field_name attribute must correspond to the name of exactly one Field_Delimited inside a Group_Field_Delimited for tabulated spectra with groups.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Center_Lookup/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = ('spectral_characteristics_to_bin_center_values')">
        <title>bcl_ir/Rule</title>
        In the sp:Bin_Center_Lookup class, the attribute pds:reference_type must be equal to 'spectral_characteristics_to_bin_center_values'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Center_Lookup/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = ('spectral_characteristics_to_bin_center_values')">
        <title>bcl_lir/Rule</title>
        In the sp:Bin_Center_Lookup class, the attribute pds:local_reference_type must be equal to 'spectral_characteristics_to_bin_center_values'.</sch:assert>
      <sch:assert test="pds:local_identifier_reference = //pds:local_identifier">
        <title>bcl_lir/Rule</title>
        In sp:Bin_Center_Lookup, the pds:local_identifier_reference must match the pds:local_identifier of a data object in the product label.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Center_Lookup/sp:bin_center_field_number_list">
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="val" value="normalize-space(string())"/>
      <sch:let name="numlist" value="substring($val,2,string-length($val)-2)"/>
      <sch:assert test="if ($objtype = 'Table_Character') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:field_number[data(.)=$n])=1) else true()">
        <title>bcllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_center_field_number_list must correspond to the value of a field_number attribute in a Field_Character definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Binary') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:field_number[data(.)=$n])=1) else true()">
        <title>bcllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_center_field_number_list must correspond to the value of a field_number attribute in a Field_Binary definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Delimited') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:field_number[data(.)=$n])=1) else true()">
        <title>bcllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_center_field_number_list must correspond to the value of a field_number attribute in a Field_Delimited definition.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Energy">
      <sch:let name="binnum" value="count(../sp:Bin_Energy)"/>
      <sch:assert test="sp:bin_sequence_number &gt;= 1 and sp:bin_sequence_number &lt;= $binnum">
        <title>bin_en_seq/Rule</title>
        In sp:Bin_Energy, bin_sequence_numbers must be between 1 and the number of bins, inclusive.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Frequency">
      <sch:let name="binnum" value="count(../sp:Bin_Frequency)"/>
      <sch:assert test="sp:bin_sequence_number &gt;= 1 and sp:bin_sequence_number &lt;= $binnum">
        <title>bin_fr_seq/Rule</title>
        In sp:Bin_Frequency, bin_sequence_numbers must be between 1 and the number of bins, inclusive.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Lookup">
      <sch:assert test="if (sp:Bin_Center_Lookup/sp:bin_center_field_name and sp:Bin_Width_Lookup/sp:bin_width_field_name) then (data(sp:Bin_Center_Lookup/sp:bin_center_field_name) != data(sp:Bin_Width_Lookup/sp:bin_width_field_name)) else true()">
        <title>bin_unique/Rule</title>
        In sp:Spectral_Lookup, sp:bin_center_field_name and sp:bin_width_field_name may not have the same value.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavelength">
      <sch:let name="binnum" value="count(../sp:Bin_Wavelength)"/>
      <sch:assert test="sp:bin_sequence_number &gt;= 1 and sp:bin_sequence_number &lt;= $binnum">
        <title>bin_wl_seq/Rule</title>
        In sp:Bin_Wavelength, bin_sequence_numbers must be between 1 and the number of bins, inclusive.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavenumber">
      <sch:let name="binnum" value="count(../sp:Bin_Wavenumber)"/>
      <sch:assert test="sp:bin_sequence_number &gt;= 1 and sp:bin_sequence_number &lt;= $binnum">
        <title>bin_wn_seq/Rule</title>
        In sp:Bin_Wavenumber, bin_sequence_numbers must be between 1 and the number of bins, inclusive.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:assert test="if ($spectype='energy') then (sp:bin_width_energy) else true()">
        <title>bwc_type/Rule</title>
        In sp:Bin_Width_Constant, sp:bin_width_energy must be supplied for energy spectra.</sch:assert>
      <sch:assert test="if ($spectype='frequency') then (sp:bin_width_frequency) else true()">
        <title>bwc_type/Rule</title>
        In sp:Bin_Width_Constant, sp:bin_width_frequency must be supplied for frequency spectra.</sch:assert>
      <sch:assert test="if ($spectype='wavelength') then (sp:bin_width_wavelength) else true()">
        <title>bwc_type/Rule</title>
        In sp:Bin_Width_Constant, sp:bin_width_wavelength must be supplied for wavelength spectra.</sch:assert>
      <sch:assert test="if ($spectype='wavenumber') then (sp:bin_width_wavenumber) else true()">
        <title>bwc_type/Rule</title>
        In sp:Bin_Width_Constant, sp:bin_width_wavenumber must be supplied for wavenumber spectra.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Lookup">
      <sch:assert test="count(*) = 1">
        <title>bwl_content/Rule</title>
        In sp:Bin_Width_Lookup, exactly one of sp:bin_width_field_name, sp:bin_width_field_number_list, pds:Local_Identifier_Reference, or pds:Internal_Reference must be provided.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Lookup/sp:bin_width_field_name">
      <sch:let name="widfield" value="string(node())"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="specform" value="string(ancestor::sp:Spectral_Characteristics/sp:spectrum_format)"/>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly Field_Character in the referenced Table_Character object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Group_Field_Character/pds:Field_Character/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly one Field_Character inside a Group_Field_Character for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly one Field_Binary in the referenced Table_Binary object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Group_Field_Binary/pds:Field_Binary/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly one Field_Binary inside a Group_Field_Binary for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly one Field_Delimited in the referenced Table_Delimited object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype='Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Group_Field_Delimited/pds:Field_Delimited/pds:name[data(.)=$widfield]) eq 1) else true()">
        <title>bwl_field/Rule</title>
        The sp:bin_width_field_name attribute must correspond to the name of exactly one Field_Delimited inside a Group_Field_Delimited for tabulated spectra with groups.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Lookup/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = ('spectral_characteristics_to_bin_width_values')">
        <title>bwl_ir/Rule</title>
        In the sp:Bin_Width_Lookup class, the attribute pds:reference_type must be equal to 'spectral_characteristics_to_bin_width_values'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Lookup/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = ('spectral_characteristics_to_bin_width_values')">
        <title>bwl_lir/Rule</title>
        In the sp:Bin_Width_Lookup class, the attribute pds:local_reference_type must be equal to 'spectral_characteristics_to_bin_width_values'.</sch:assert>
      <sch:assert test="pds:local_identifier_reference = //pds:local_identifier">
        <title>bwl_lir/Rule</title>
        In sp:Bin_Width_Lookup, the pds:local_identifier_reference must match the pds:local_identifier of a data object in the product label.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Lookup/sp:bin_width_field_number_list">
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="val" value="normalize-space(string())"/>
      <sch:let name="numlist" value="substring($val,2,string-length($val)-2)"/>
      <sch:assert test="if ($objtype = 'Table_Character') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:field_number[data(.)=$n])=1) else true()">
        <title>bwllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_width_field_number_list must correspond to the value of a field_number attribute in a Field_Character definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Binary') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:field_number[data(.)=$n])=1) else true()">
        <title>bwllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_width_field_number_list must correspond to the value of a field_number attribute in a Field_Binary definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Delimited') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:field_number[data(.)=$n])=1) else true()">
        <title>bwllist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:bin_width_field_number_list must correspond to the value of a field_number attribute in a Field_Delimited definition.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Field_of_View/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = ('spectral_characteristics_to_document')">
        <title>fov_ir_type/Rule</title>
        In sp:Field_of_View, the attribute pds:reference_type must have a value of "spectral_characteristics_to_document".</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/sp:spectrum_format">
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="if (string(node()) = 'Tabulated-Flat') then ($objtype = ('Table_Character','Table_Binary','Table_Delimited')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of 'Tabulated-Flat' must be used with a table-type object.</sch:assert>
      <sch:assert test="if (string(node()) = 'Tabulated-Parameter Groups') then ($objtype = ('Table_Character','Table_Binary','Table_Delimited')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of 'Tabulated-Parameter Groups' must be used with a table-type object.</sch:assert>
      <sch:assert test="if (string(node()) = 'Tabulated-Point Group') then ($objtype = ('Table_Character','Table_Binary','Table_Delimited')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of 'Tabulated-Point Group' must be used with a table-type object.</sch:assert>
      <sch:assert test="if (string(node()) = '1D') then ($objtype = ('Table_Character','Table_Binary','Table_Delimited')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of '1D' must be used with a table-type object.</sch:assert>
      <sch:assert test="if (string(node()) = '2D') then ($objtype = ('Array_2D_Spectrum')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of '2D' must be used with an Array_2D_Spectrum-type object.</sch:assert>
      <sch:assert test="if (string(node()) = '3D') then ($objtype = ('Array_3D_Spectrum')) else true()">
        <title>frmt1d_field/Rule</title>
        sp:spectrum_format of '3D' must be used with an Array_3D_Spectrum-type object.</sch:assert>
      <sch:assert test="if (string(node()) = ('1D', 'Tabulated-Parameter Groups', 'Tabulated-Point Group')) then (parent::node()/sp:value_field_name) else not(parent::node()/sp:value_field_name)">
        <title>frmt1d_field/Rule</title>
        sp:value_field_name is required when sp:spectrum_format is '1D', 'Tabulated-Parameter Groups', or 'Tabulated-Point Group' and prohibited otherwise.</sch:assert>
      <sch:assert test="if (string(node()) = ('Tabulated-Flat')) then (parent::node()/sp:value_field_number_list) else not(parent::node()/sp:value_field_number_list)">
        <title>frmt1d_field/Rule</title>
        The sp:value_field_number_list attribute is required, and may only be used, when sp:spectrum_format is 'Tabulated-Flat'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:assert test="if ($spectype='energy') then (sp:resolution_limit_energy or not(sp:resolution_limit_frequency or sp:resolution_limit_wavelength or sp:resolution_limit_wavenumber)) else true()">
        <title>obsparm_sr/Rule</title>
        In sp:Observation_Parameters, only sp:resolution_limit_energy may be included for energy spectra.</sch:assert>
      <sch:assert test="if ($spectype='frequency') then (sp:resolution_limit_frequency or not(sp:resolution_limit_energy or sp:resolution_limit_wavelength or sp:resolution_limit_wavenumber)) else true()">
        <title>obsparm_sr/Rule</title>
        In sp:Observation_Parameters, only sp:resolution_limit_frequency may be included for frequency spectra.</sch:assert>
      <sch:assert test="if ($spectype='wavelength') then (sp:resolution_limit_wavelength or not(sp:resolution_limit_energy or sp:resolution_limit_frequency or sp:resolution_limit_wavenumber)) else true()">
        <title>obsparm_sr/Rule</title>
        In sp:Observation_Parameters, only sp:resolution_limit_wavelength may be included for wavelength spectra.</sch:assert>
      <sch:assert test="if ($spectype='wavenumber') then (sp:resolution_limit_wavenumber or not(sp:resolution_limit_energy or sp_resolution_limit_frequency or sp:resolution_limit_wavelength)) else true()">
        <title>obsparm_sr/Rule</title>
        In sp:Observation_Parameters, only sp:resolution_limit_wavenumber may be included for wavenumber spectra.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/pds:Local_Internal_Reference">
      <sch:let name="objid" value="string(pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="pds:local_reference_type = ('spectral_characteristics_to_array_object', 'spectral_characteristics_to_table_object')">
        <title>sc_lir/Rule</title>
        sp:Spectral_Characteristics: The attribute pds:local_reference_type must be equal to either 'spectral_characteristics_to_array_object' or 'spectral_characteristics_to_table_object'.</sch:assert>
      <sch:assert test="if (pds:local_reference_type = ('spectral_characteristics_to_array_object')) then ($objtype = ('Array_2D_Spectrum', 'Array_3D_Spectrum')) else true()">
        <title>sc_lir/Rule</title>
        The Array-type object referenced by sp:Spectral_Characteristics must be either an Array_2D_Spectrum or an Array_3D_Spectrum.</sch:assert>
      <sch:assert test="if (pds:local_reference_type = ('spectral_characteristics_to_table_object')) then ($objtype = ('Table_Character', 'Table_Binary', 'Table_Delimited')) else true()">
        <title>sc_lir/Rule</title>
        In sp:Spectral_Characteristics must reference either a Table_Character, Table_Binary, or Table_Delimited object when pds:local_reference_type is 'spectral_characteristics_to_table_object'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Energy/sp:bin_width_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Bin_Energy/sp:bin_width_energy/sp:bin_width_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Energy/sp:center_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Bin_Energy/sp:center_energy/sp:center_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Frequency/sp:bin_width_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Bin_Frequency/sp:bin_width_frequency/sp:bin_width_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Frequency/sp:center_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Bin_Frequency/sp:center_frequency/sp:center_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavelength/sp:bin_width_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Bin_Wavelength/sp:bin_width_wavelength/sp:bin_width_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavelength/sp:center_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Bin_Wavelength/sp:center_wavelength/sp:center_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavenumber/sp:bin_width_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Bin_Wavenumber/sp:bin_width_wavenumber/sp:bin_width_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavenumber/sp:bin_width_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Bin_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Bin_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Bin_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavenumber/sp:center_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Bin_Wavenumber/sp:center_wavenumber/sp:center_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Wavenumber/sp:center_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Bin_Wavenumber/sp:center_wavenumber role="warning"/sp:center_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Bin_Wavenumber/sp:center_wavenumber role="warning"/sp:center_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Bin_Wavenumber/sp:center_wavenumber role="warning"/sp:center_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant/sp:bin_width_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Bin_Width_Constant/sp:bin_width_energy/sp:bin_width_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant/sp:bin_width_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Bin_Width_Constant/sp:bin_width_frequency/sp:bin_width_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant/sp:bin_width_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Bin_Width_Constant/sp:bin_width_wavelength/sp:bin_width_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant/sp:bin_width_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Bin_Width_Constant/sp:bin_width_wavenumber/sp:bin_width_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Bin_Width_Constant/sp:bin_width_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Bin_Width_Constant/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Bin_Width_Constant/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Bin_Width_Constant/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Circular_FOV/sp:diameter_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Circular_FOV/sp:diameter_angle/sp:diameter_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Complex_FOV/sp:body_positive_pole_position_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Complex_FOV/sp:body_positive_pole_position_angle/sp:body_positive_pole_position_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Complex_FOV/sp:celestial_north_position_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Complex_FOV/sp:celestial_north_position_angle/sp:celestial_north_position_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Complex_FOV/sp:length_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Complex_FOV/sp:length_angle/sp:length_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Complex_FOV/sp:width_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Complex_FOV/sp:width_angle/sp:width_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:net_integration_time">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 'ns', 's', 'yr')">
        <title>sp:Observation_Parameters/sp:net_integration_time/sp:net_integration_time</title>
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 'ns', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:resolution_limit_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Observation_Parameters/sp:resolution_limit_energy/sp:resolution_limit_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:resolution_limit_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Observation_Parameters/sp:resolution_limit_frequency/sp:resolution_limit_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:resolution_limit_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Observation_Parameters/sp:resolution_limit_wavelength/sp:resolution_limit_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:resolution_limit_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Observation_Parameters/sp:resolution_limit_wavenumber/sp:resolution_limit_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Observation_Parameters/sp:resolution_limit_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Observation_Parameters/sp:resolution_limit_wavenumber role="warning"/sp:resolution_limit_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Observation_Parameters/sp:resolution_limit_wavenumber role="warning"/sp:resolution_limit_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Observation_Parameters/sp:resolution_limit_wavenumber role="warning"/sp:resolution_limit_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Rectangular_FOV/sp:body_positive_pole_position_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Rectangular_FOV/sp:body_positive_pole_position_angle/sp:body_positive_pole_position_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Rectangular_FOV/sp:celestial_north_position_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Rectangular_FOV/sp:celestial_north_position_angle/sp:celestial_north_position_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Rectangular_FOV/sp:length_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Rectangular_FOV/sp:length_angle/sp:length_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Rectangular_FOV/sp:width_angle">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        <title>sp:Rectangular_FOV/sp:width_angle/sp:width_angle</title>
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/sp:spectral_bin_type">
      <sch:assert test=". = ('energy', 'frequency', 'wavelength', 'wavenumber')">
        <title>sp:Spectral_Characteristics/sp:spectral_bin_type/sp:spectral_bin_type</title>
        The attribute sp:spectral_bin_type must be equal to one of the following values 'energy', 'frequency', 'wavelength', 'wavenumber'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/sp:spectrum_format">
      <sch:assert test=". = ('1D', '2D', '3D', 'Tabulated-Flat', 'Tabulated-Parameter Groups', 'Tabulated-Point Group')">
        <title>sp:Spectral_Characteristics/sp:spectrum_format/sp:spectrum_format</title>
        The attribute sp:spectrum_format must be equal to one of the following values '1D', '2D', '3D', 'Tabulated-Flat', 'Tabulated-Parameter Groups', 'Tabulated-Point Group'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy/sp:bin_width_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Uniformly_Sampled_Energy/sp:bin_width_energy/sp:bin_width_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy/sp:first_center_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Uniformly_Sampled_Energy/sp:first_center_energy/sp:first_center_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy/sp:last_center_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Uniformly_Sampled_Energy/sp:last_center_energy/sp:last_center_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy/sp:sampling_interval_energy">
      <sch:assert test="@unit = ('J', 'MeV', 'eV', 'keV')">
        <title>sp:Uniformly_Sampled_Energy/sp:sampling_interval_energy/sp:sampling_interval_energy</title>
        The attribute @unit must be equal to one of the following values 'J', 'MeV', 'eV', 'keV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy/sp:sampling_scale">
      <sch:assert test=". = ('Linear', 'Logarithmic')">
        <title>sp:Uniformly_Sampled_Energy/sp:sampling_scale/sp:sampling_scale</title>
        The attribute sp:sampling_scale must be equal to one of the following values 'Linear', 'Logarithmic'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency/sp:bin_width_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Uniformly_Sampled_Frequency/sp:bin_width_frequency/sp:bin_width_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency/sp:first_center_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Uniformly_Sampled_Frequency/sp:first_center_frequency/sp:first_center_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency/sp:last_center_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Uniformly_Sampled_Frequency/sp:last_center_frequency/sp:last_center_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency/sp:sampling_interval_frequency">
      <sch:assert test="@unit = ('GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz')">
        <title>sp:Uniformly_Sampled_Frequency/sp:sampling_interval_frequency/sp:sampling_interval_frequency</title>
        The attribute @unit must be equal to one of the following values 'GHz', 'Hz', 'MHz', 'THz', 'kHz', 'mHz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency/sp:sampling_scale">
      <sch:assert test=". = ('Linear', 'Logarithmic')">
        <title>sp:Uniformly_Sampled_Frequency/sp:sampling_scale/sp:sampling_scale</title>
        The attribute sp:sampling_scale must be equal to one of the following values 'Linear', 'Logarithmic'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength/sp:bin_width_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Uniformly_Sampled_Wavelength/sp:bin_width_wavelength/sp:bin_width_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength/sp:first_center_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Uniformly_Sampled_Wavelength/sp:first_center_wavelength/sp:first_center_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength/sp:last_center_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Uniformly_Sampled_Wavelength/sp:last_center_wavelength/sp:last_center_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength/sp:sampling_interval_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        <title>sp:Uniformly_Sampled_Wavelength/sp:sampling_interval_wavelength/sp:sampling_interval_wavelength</title>
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength/sp:sampling_scale">
      <sch:assert test=". = ('Linear', 'Logarithmic')">
        <title>sp:Uniformly_Sampled_Wavelength/sp:sampling_scale/sp:sampling_scale</title>
        The attribute sp:sampling_scale must be equal to one of the following values 'Linear', 'Logarithmic'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber/sp:bin_width_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:bin_width_wavenumber role="warning"/sp:bin_width_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber/sp:first_center_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber role="warning"/sp:first_center_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber role="warning"/sp:first_center_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:first_center_wavenumber role="warning"/sp:first_center_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber/sp:last_center_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber role="warning"/sp:last_center_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber role="warning"/sp:last_center_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:last_center_wavenumber role="warning"/sp:last_center_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber">
      <sch:assert test="@unit = ('1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1')">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber/sp:sampling_interval_wavenumber</title>
        The attribute @unit must be equal to one of the following values '1/cm', '1/m', '1/nm', 'cm**-1', 'm**-1', 'nm**-1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber" role="warning">
      <sch:assert test="@unit != 'cm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber role="warning"/sp:sampling_interval_wavenumber</title>
        The unit value cm**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber role="warning"/sp:sampling_interval_wavenumber</title>
        The unit value m**-1 is deprecated and should not be used.</sch:assert>
      <sch:assert test="@unit != 'nm**-1'">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:sampling_interval_wavenumber role="warning"/sp:sampling_interval_wavenumber</title>
        The unit value nm**-1 is deprecated and should not be used.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber/sp:sampling_scale">
      <sch:assert test=". = ('Linear', 'Logarithmic')">
        <title>sp:Uniformly_Sampled_Wavenumber/sp:sampling_scale/sp:sampling_scale</title>
        The attribute sp:sampling_scale must be equal to one of the following values 'Linear', 'Logarithmic'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Energy">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="$spectype = ('energy')">
        <title>us_energy/Rule</title>
        The sp:Uniformaly_Sampled_Energy may only be used when sp:spectral_bin_type is "energy".</sch:assert>
      <sch:assert test="if ($objtype = ('Array_2D_Spectrum', 'Array_3D_Spectrum')) then (//parent::node()[pds:local_identifier=$objid]/pds:Axis_Array/pds:axis_name=sp:axis_name) else true()">
        <title>us_energy/Rule</title>
        If the referenced object is an array, then sp:axis_name must correspond to the name attribute of one of the Array_Axis classes in that array object.</sch:assert>
      <sch:assert test="if ($objtype = ('Table_Character', 'Table_Binary', 'Table_Delimited')) then (sp:axis_name = ('Row','Field')) else true()">
        <title>us_energy/Rule</title>
        Specify "Row" for a spectral table to indicate that the rows constitute uniformly sampled bins.
                Specify "Field" to indicate that each row contains a complete spectrum and the fields constitute uniformly sample bins.</sch:assert>
      <sch:assert test="if (sp:sampling_scale = 'Linear') then (not(sp:sampling_base)) else true()">
        <title>us_energy/Rule</title>
        The sp:sampling_base attribute is forbidden if sp:sampling_scale is "Linear".</sch:assert>
      <sch:assert test="if (sp:sampling_scale ne 'Linear') then (sp:sampling_base) else true()">
        <title>us_energy/Rule</title>
        The sp:sampling_base attribute is required for non-Linear sampling scales.</sch:assert>
      <sch:assert test="number(sp:first_center_energy) lt number(sp:last_center_energy)">
        <title>us_energy/Rule</title>
        In the Uniformly_Sampled classes, the first_center value must be less than the last_center value.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Frequency">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="$spectype = ('frequency')">
        <title>us_freq/Rule</title>
        The sp:Uniformaly_Sampled_Frequency may only be used when sp:spectral_bin_type is "frequency".</sch:assert>
      <sch:assert test="if ($objtype = ('Array_2D_Spectrum', 'Array_3D_Spectrum')) then (//parent::node()[pds:local_identifier=$objid]/pds:Axis_Array/pds:axis_name=sp:axis_name) else true()">
        <title>us_freq/Rule</title>
        If the referenced object is an array, then sp:axis_name must correspond to the name attribute of one of the Array_Axis classes in that array object.</sch:assert>
      <sch:assert test="if ($objtype = ('Table_Character', 'Table_Binary', 'Table_Delimited')) then (sp:axis_name = ('Row','Field')) else true()">
        <title>us_freq/Rule</title>
        Specify "Row" for a spectral table to indicate that the rows constitute uniformly sampled bins.
                          Specify "Field" to indicate that each row contains a complete spectrum and the fields constitute uniformly sample bins.</sch:assert>
      <sch:assert test="if (sp:sampling_scale = 'Linear') then (not(sp:sampling_base)) else true()">
        <title>us_freq/Rule</title>
        The sp:sampling_base attribute is forbidden if sp:sampling_scale is "Linear".</sch:assert>
      <sch:assert test="if (sp:sampling_scale ne 'Linear') then (sp:sampling_base) else true()">
        <title>us_freq/Rule</title>
        The sp:sampling_base attribute is required for non-Linear sampling scales.</sch:assert>
      <sch:assert test="number(sp:first_center_frequency) lt number(sp:last_center_frequency)">
        <title>us_freq/Rule</title>
        In the Uniformly_Sampled classes, the first_center value must be less than the last_center value.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavelength">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="$spectype = ('wavelength')">
        <title>us_wavelength/Rule</title>
        The sp:Uniformaly_Sampled_Wavelength may only be used when sp:spectral_bin_type is "wavelength".</sch:assert>
      <sch:assert test="if ($objtype = ('Array_2D_Spectrum', 'Array_3D_Spectrum')) then (//parent::node()[pds:local_identifier=$objid]/pds:Axis_Array/pds:axis_name=sp:axis_name) else true()">
        <title>us_wavelength/Rule</title>
        If the referenced object is an array, then sp:axis_name must correspond to the name attribute of one of the Array_Axis classes in that array object.</sch:assert>
      <sch:assert test="if ($objtype = ('Table_Character', 'Table_Binary', 'Table_Delimited')) then (sp:axis_name = ('Row','Field')) else true()">
        <title>us_wavelength/Rule</title>
        Specify "Row" for a spectral table to indicate that the rows constitute uniformly sampled bins.
                Specify "Field" to indicate that each row contains a complete spectrum and the fields constitute uniformly sample bins.</sch:assert>
      <sch:assert test="if (sp:sampling_scale = 'Linear') then (not(sp:sampling_base)) else true()">
        <title>us_wavelength/Rule</title>
        The sp:sampling_base attribute is forbidden if sp:sampling_scale is "Linear".</sch:assert>
      <sch:assert test="if (sp:sampling_scale ne 'Linear') then (sp:sampling_base) else true()">
        <title>us_wavelength/Rule</title>
        The sp:sampling_base attribute is required for non-Linear sampling scales.</sch:assert>
      <sch:assert test="number(sp:first_center_wavelength) lt number(sp:last_center_wavelength)">
        <title>us_wavelength/Rule</title>
        In the Uniformly_Sampled classes, the first_center value must be less than the last_center value.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Uniformly_Sampled_Wavenumber">
      <sch:let name="spectype" value="string(ancestor::sp:Spectral_Characteristics/sp:spectral_bin_type)"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:assert test="$spectype = ('wavenumber')">
        <title>us_wavenumber/Rule</title>
        The sp:Uniformaly_Sampled_Wavenumber may only be used when sp:spectral_bin_type is "wavenumber".</sch:assert>
      <sch:assert test="if ($objtype = ('Array_2D_Spectrum', 'Array_3D_Spectrum')) then (//parent::node()[pds:local_identifier=$objid]/pds:Axis_Array/pds:axis_name=sp:axis_name) else true()">
        <title>us_wavenumber/Rule</title>
        If the referenced object is an array, then sp:axis_name must correspond to the name attribute of one of the Array_Axis classes in that array object.</sch:assert>
      <sch:assert test="if ($objtype = ('Table_Character', 'Table_Binary', 'Table_Delimited')) then (sp:axis_name = ('Row','Field')) else true()">
        <title>us_wavenumber/Rule</title>
        Specify "Row" for a spectral table to indicate that the rows constitute uniformly sampled bins.
                Specify "Field" to indicate that each row contains a complete spectrum and the fields constitute uniformly sample bins.</sch:assert>
      <sch:assert test="if (sp:sampling_scale = 'Linear') then (not(sp:sampling_base)) else true()">
        <title>us_wavenumber/Rule</title>
        The sp:sampling_base attribute is forbidden if sp:sampling_scale is "Linear".</sch:assert>
      <sch:assert test="if (sp:sampling_scale ne 'Linear') then (sp:sampling_base) else true()">
        <title>us_wavenumber/Rule</title>
        The sp:sampling_base attribute is required for non-Linear sampling scales.</sch:assert>
      <sch:assert test="number(sp:first_center_wavenumber) lt number(sp:last_center_wavenumber)">
        <title>us_wavenumber/Rule</title>
        In the Uniformly_Sampled classes, the first_center value must be less than the last_center value.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/sp:value_field_name">
      <sch:let name="valfield" value="string(node())"/>
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="specform" value="string(ancestor::sp:Spectral_Characteristics/sp:spectrum_format)"/>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Character in the referenced Table_Character object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Character')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Group_Field_Character/pds:Field_Character/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Character inside a Group_Field_Character for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Binary in the referenced Table_Binary object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype = 'Table_Binary')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Group_Field_Binary/pds:Field_Binary/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Binary inside a Group_Field_Binary for tabulated spectra with groups.</sch:assert>
      <sch:assert test="if (($specform = '1D') and ($objtype = 'Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Delimited in the referenced Table_Delimited object.</sch:assert>
      <sch:assert test="if (($specform = ('Tabulated-Parameter Groups','Tabulated-Point Group')) and ($objtype='Table_Delimited')) then (count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Group_Field_Delimited/pds:Field_Delimited/pds:name[data(.)=$valfield]) eq 1) else true()">
        <title>valfld_present/Rule</title>
        The sp:value_field_name attribute must correspond to the name of exactly one Field_Delimited inside a Group_Field_Delimited for tabulated spectra with groups.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="sp:Spectral_Characteristics/sp:value_field_number_list">
      <sch:let name="objid" value="string(ancestor::sp:Spectral_Characteristics/pds:Local_Internal_Reference/pds:local_identifier_reference)"/>
      <sch:let name="objtype" value="local-name(//parent::node()[pds:local_identifier=$objid])"/>
      <sch:let name="val" value="normalize-space(string())"/>
      <sch:let name="numlist" value="substring($val,2,string-length($val)-2)"/>
      <sch:assert test="if ($objtype = 'Table_Character') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Character/pds:Field_Character/pds:field_number[data(.)=$n])=1) else true()">
        <title>vallist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:value_field_number_list must correspond to the value of a field_number attribute in a Field_Character definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Binary') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Binary/pds:Field_Binary/pds:field_number[data(.)=$n])=1) else true()">
        <title>vallist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:value_field_number_list must correspond to the value of a field_number attribute in a Field_Binary definition.</sch:assert>
      <sch:assert test="if ($objtype = 'Table_Delimited') then (every $n in (tokenize($numlist,'\s*,\s*')) satisfies count(//parent::node()[pds:local_identifier=$objid]/pds:Record_Delimited/pds:Field_Delimited/pds:field_number[data(.)=$n])=1) else true()">
        <title>vallist_eu/Rule</title>
        For Tabulated-Flat spectra, every value of sp:value_field_number_list must correspond to the value of a field_number attribute in a Field_Delimited definition.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
