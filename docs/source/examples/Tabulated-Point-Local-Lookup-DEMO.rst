########################################################################################
Tabulated-Point Group Spectrum, local Spectral Lookup
########################################################################################

.. code-block:: XML

    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-model href="https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1L00.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
    <?xml-model href="https://pds.nasa.gov/pds4/sp/v1/PDS4_SP_1L00_1320.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
    
    <!-- 
        This "label" is intended only to demonstrate how to use certain features of the Spectral
        Dictionary, and pretty much nothing else. It is not a real label in any sense, even though
        it should produce no errors when validated against the PDS schema. A real label would have
        references to additional dictionaries, for example, from the mission, for geometry, and/or
        for any other related discipline or local namespaces. Any "data" you see here is fictitious,
        and provided merely to remove any validation errors that might otherwise occur.
        
        Note, in particular, that any conscientious reviewer would consider the data structure classes
        to be inadequate without appropriate descriptions, extrema, null data indicators, and similar
        essential metadata.
        
        This label demonstrates:
           - Using <sp:Spectral_Characteristics> for a spectral table in the "Tabulated-Point Group" fornat;
           - Using the <sp:Complex_FOV> to describe the aperture; and
           - Using the <sp:Spectral_Lookup> class to identify bin centers and widths as fields within the
             repeating sequence of values for each spectral measurement (i.e., each "point" or "bin")
    
    -->
    
    <Product_Observational xmlns="http://pds.nasa.gov/pds4/pds/v1"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:sp="http://pds.nasa.gov/pds4/sp/v1"
        xsi:schemaLocation="http://pds.nasa.gov/pds4/pds/v1 https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1L00.xsd
                            http://pds.nasa.gov/pds4/sp/v1  https://pds.nasa.gov/pds4/sp/v1/PDS4_SP_1L00_1320.xsd">
        <Identification_Area>
            <logical_identifier>urn:nasa:pds:bundle:collection:product</logical_identifier>
            <version_id>1.0</version_id>
            <title>Test Label for Spectral Dictionary, Tabulated Spectra - Valid Label</title>
            <information_model_version>1.21.0.0</information_model_version>
            <product_class>Product_Observational</product_class>
        </Identification_Area>
        
        <Observation_Area>
            <Time_Coordinates>
                <start_date_time xsi:nil="true" nilReason="inapplicable"/>
                <stop_date_time xsi:nil="true" nilReason="inapplicable"/>
            </Time_Coordinates>
            
            <Investigation_Area>
                <name>None</name>
                <type>Individual Investigation</type>
                <Internal_Reference>
                    <lid_reference>urn:nasa:pds:context:investigation:individual.none</lid_reference>
                    <reference_type>data_to_investigation</reference_type>
                </Internal_Reference>
            </Investigation_Area>
            <Observing_System>
                <Observing_System_Component>
                    <name>None</name>
                    <type>Telescope</type>
                </Observing_System_Component>
            </Observing_System>
            <Target_Identification>
                <name>None</name>
                <type>Comet</type>
            </Target_Identification>
            
            <Discipline_Area>
                
                <!-- Tabulated-Point Groups -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>TabPointGroups</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_table_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>Tabulated-Point Group</sp:spectrum_format>
                    <sp:value_field_name>Counts</sp:value_field_name>
                    <sp:spectral_bin_type>wavelength</sp:spectral_bin_type>
                    <sp:Field_of_View>
                        <sp:description>
                            If the FOV is complex (if the aperture has varying width, for example), then
                            a description of the overall shape of the aperture needs to be supplied in 
                            this field, but you will need to supply a detailed description as part of the
                            documentation for the data.  You can and should specify any dimensions that are
                            relevant, whether they are "real" or "effective", but detailed documentation
                            should be formally referenced elsewhere in the archive so users can get to it
                            easily.  
                        </sp:description>
                        <sp:Complex_FOV>
                            <sp:width_angle unit="arcsec">5.43</sp:width_angle>
                            <sp:length_angle unit="arcsec">1.23</sp:length_angle>
                            <sp:body_positive_pole_position_angle unit="deg">90</sp:body_positive_pole_position_angle>
                        </sp:Complex_FOV>
                        <Internal_Reference>
                            <lid_reference>urn:nasa:pds:bindle:collection:document</lid_reference>
                            <reference_type>spectral_characteristics_to_document</reference_type>
                            <comment>
                                This document provides details of the aperture geometry defining the 
                                Field of View, with implications for data reduction.
                            </comment>
                        </Internal_Reference>
                    </sp:Field_of_View>
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            HOW the bin parameters were determined/defined/derived
                        </sp:bin_profile_description>
                        <sp:Spectral_Lookup>
                            <sp:Bin_Center_Lookup>
                                <sp:bin_center_field_name>Band Center</sp:bin_center_field_name>
                            </sp:Bin_Center_Lookup>
                            <sp:Bin_Width_Lookup>
                                <sp:bin_width_field_name>Bandpass</sp:bin_width_field_name>
                            </sp:Bin_Width_Lookup>
                        </sp:Spectral_Lookup>
                    </sp:Bin_Description>
                </sp:Spectral_Characteristics>
                
            </Discipline_Area>
        </Observation_Area>
        
        <File_Area_Observational>
            <File>
                <file_name>No.Data</file_name>
            </File>
            
            <!-- Tabulated-Point Group -->
            
            <Table_Delimited>
                <name>Point Groups Spectra Table</name>
                <local_identifier>TabPointGroups</local_identifier>
                <offset unit="byte">300000</offset>
                <parsing_standard_id>PDS DSV 1</parsing_standard_id>
                <description>
                    This table contains one spectrum per row, but in this case all the parameters associated with each point are 
                    grouped together, and that group repeats for each point in the spectrum - so the observed counts, error, 
                    bin center, and bin width for the first spectral point are listed; then the (counts, error, center, width)
                    for the second point, and so on.
                    
                    In this case all the spectral parameters should be contained in the same group, but there may be other parameters
                    included in that same group if desired.
                </description>
                <records>100</records>
                <record_delimiter>Carriage-Return Line-Feed</record_delimiter>
                <field_delimiter>Comma</field_delimiter>
                
                <Record_Delimited>
                    <fields>2</fields>
                    <groups>1</groups>
                    
                    <Field_Delimited>
                        <name>Target</name>
                        <data_type>ASCII_String</data_type>
                    </Field_Delimited>
                    
                    <Field_Delimited>
                        <name>Date Observed</name>
                        <data_type>ASCII_Date_YMD</data_type>
                    </Field_Delimited>
                    
                    <!-- This group structure defines the sequence of fields provided for each spectral point (i.e., "bin"). -->
                        
                    <Group_Field_Delimited>
                        <name>Spectral Point</name>
                        <repetitions>25</repetitions>
                        <fields>3</fields>
                        <groups>0</groups>
                        
                        <Field_Delimited>
                            <name>Counts</name>
                            <data_type>ASCII_Integer</data_type>
                            <unit>DN</unit>
                        </Field_Delimited>
                        
                        <Field_Delimited>
                            <name>Band Center</name>
                            <data_type>ASCII_Real</data_type>
                            <unit>nm</unit>
                        </Field_Delimited>
                        
                        <Field_Delimited>
                            <name>Bandpass</name>
                            <data_type>ASCII_Integer</data_type>
                            <unit>nm</unit>
                        </Field_Delimited>
                    </Group_Field_Delimited>
                </Record_Delimited>
            </Table_Delimited>
            
        </File_Area_Observational>
    </Product_Observational>
