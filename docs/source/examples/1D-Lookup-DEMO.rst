#######################################################################
1D Spectrum, Spectral Lookup
#######################################################################

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
       - Using <sp:Spectral_Characteristics> for a "1D" table spectrum;
       - Using the <sp:Complex_FOV> to describe the aperture; and
       - Using the <sp:Spectral_Lookup> class to identify bin centers and widths as fields in 
         the table.
    -->

    <Product_Observational xmlns="http://pds.nasa.gov/pds4/pds/v1"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:sp="http://pds.nasa.gov/pds4/sp/v1"
        xsi:schemaLocation="http://pds.nasa.gov/pds4/pds/v1 https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1L00.xsd
                            http://pds.nasa.gov/pds4/sp/v1  http://pds.nasa.gov/pds4/sp/v1/PDS4_SP_1L00_1320.xsd">
        <Identification_Area>
            <logical_identifier>urn:nasa:pds:bundle:collection:product</logical_identifier>
            <version_id>1.0</version_id>
            <title>Test Label 1 for Spectral Dictionary - Valid Label</title>
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
            
                <!-- Spectral Lookup for 1D spectrum (table), in Table fields -->
            
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <comment>
                            The spectral bin centers are included in the table in the named field.  In
                            this case, FWHM values are also included in the table as a separate field.
                            Table field classes must have 'name' attributes (although these are not
                            currently required to be unique).  
                        </comment>
                        <local_identifier_reference>TableChar1D</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_table_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>1D</sp:spectrum_format>
                    <sp:value_field_name>Intensity</sp:value_field_name>
                    <sp:spectral_bin_type>wavelength</sp:spectral_bin_type>
                
                    <sp:Observation_Parameters>
                        <sp:number_of_exposures>1</sp:number_of_exposures>
                        <sp:net_integration_time unit="s">20</sp:net_integration_time>
                        <sp:resolution_limit_wavelength unit="nm">5</sp:resolution_limit_wavelength>
                    </sp:Observation_Parameters>
                
                    <sp:Field_of_View>
                        <sp:description>
                            This field of view is not a regular shape.  Typically this should be 
                            described in some detail in a document that is referenced within this
                            class (we'll assume one exists in this case as a demonstration).  For
                            example, the Alice spectrometer on New Horizons has a "lollipop" shaped
                            slit.  I don't know the actual dimensions of that slit, so the 
                            description below is fake.  This description would specify how the
                            'width' value indicated here correspond to the slit design, for example.
                        </sp:description>
                        <sp:Complex_FOV>
                            <sp:width_angle unit="arcsec">10</sp:width_angle>
                            <sp:width_angle unit="arcsec">5</sp:width_angle>
                            <sp:length_angle unit="arcsec">100</sp:length_angle>
                            <sp:celestial_north_position_angle unit="deg">70</sp:celestial_north_position_angle>
                        </sp:Complex_FOV>
                        <Internal_Reference>
                            <lid_reference>urn:nasa:pds:nh_docs:slit_specs</lid_reference>
                            <reference_type>spectral_characteristics_to_document</reference_type>
                            <comment>
                                This document provides both a diagram and specific physical 
                                measurements of the lollipop-shaped slit.
                            </comment>
                        </Internal_Reference>
                    </sp:Field_of_View>
                
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            Bin widths indicated in the table are those listed in the manufacturer's 
                            specifications.
                        </sp:bin_profile_description>
                        <sp:Spectral_Lookup>
                            <sp:Bin_Center_Lookup>
                                <sp:bin_center_field_name>Center Wavelength</sp:bin_center_field_name>
                            </sp:Bin_Center_Lookup>
                            <sp:Bin_Width_Lookup>
                                <sp:bin_width_field_name>FWHM</sp:bin_width_field_name>
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
        
            <!-- 1D Spectral Table  -->
            
            <Table_Character>
                <local_identifier>TableChar1D</local_identifier>
                <offset unit="byte">0</offset>
                <records>100</records>
                <description>
                    This is just one of many possible structures for a set of 
                    spectra in tabulated format.
                </description>
                <record_delimiter>Carriage-Return Line-Feed</record_delimiter>
                <Record_Character>
                    <fields>4</fields>
                    <groups>0</groups>
                    <record_length unit="byte">50</record_length>
                
                    <Field_Character>
                        <name>Intensity</name>
                        <field_location unit="byte">1</field_location>
                        <data_type>ASCII_Real</data_type>
                        <field_length unit="byte">5</field_length>
                    </Field_Character>
                
                    <Field_Character>
                        <name>Error</name>
                        <field_location unit="byte">6</field_location>
                        <data_type>ASCII_Real</data_type>
                        <field_length unit="byte">4</field_length>
                    </Field_Character>
                
                    <Field_Character>
                        <name>Center Wavelength</name>
                        <field_location unit="byte">12</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <unit>nanometer</unit>
                    </Field_Character>
                
                    <Field_Character>
                        <name>FWHM</name>
                        <field_location unit="byte">20</field_location>
                        <data_type>ASCII_Real</data_type>
                        <field_length unit="byte">6</field_length>
                        <unit>angstrom</unit>
                    </Field_Character>
                </Record_Character>
            </Table_Character>
        
        </File_Area_Observational>
    </Product_Observational>
