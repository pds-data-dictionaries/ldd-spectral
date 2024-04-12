###############################################################################################
Tabulated-Flat Spectrum, field number list
###############################################################################################

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
        to be inadequate without appropriate descriptions, extrema, null data indicates, and similar
        essential metadata.
    
        This label demonstrates:
           - Using <sp:Spectral_Characteristics> for a spectral table in the "Tabulated-Flat" fornat;
           - Using the <sp:Circular_FOV> to describe the aperture; and
           - Using the <sp:Spectral_Lookup> class to identify bin centers as fields in the table.
    
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
            
            <Citation_Information>
                <author_list>Raugh, Anne C.</author_list>
                <publication_year>2019</publication_year>
                <description>
                    TEST LABEL
                    
                    This label is used to test the classes and constraints defined in the Spectral Discipline
                    Dictionary related to tabulated spectra - data tables in which each row represents a single,
                    complete spectral observation.  
                    
                    While this label may be schematically valid with respect to the PDS core namespace and does
                    provide a rudimentary demonstration of spectral labelling techniques, it should not be taken 
                    as a "good example" of a product label or of how to use the classes within the Spectral
                    Discipline Dictionary.  It does not represent any "real" data product.
                </description>
            </Citation_Information>
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
                
                <!-- Tabulated-Flat Spectra -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>TabFlat</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_table_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>Tabulated-Flat</sp:spectrum_format>
                    <sp:value_field_number_list>(2, 5, 8, 11)</sp:value_field_number_list>
                    <sp:spectral_bin_type>wavelength</sp:spectral_bin_type>
                    <sp:Field_of_View>
                        <sp:description>
                            This description must contain a human-readable description of the slit/aperture.
                            It should tell a user what they need to understand fundamentally before using 
                            the spectral data.  It may be as simple as "Circular aperture" if that is all
                            there is to say.
                        </sp:description>
                        <sp:Circular_FOV>
                            <sp:diameter_angle unit="arcsec">5.0</sp:diameter_angle>
                        </sp:Circular_FOV>
                    </sp:Field_of_View>
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            This text should describe HOW bin profiles were determined/defined.
                        </sp:bin_profile_description>
                        
                        <!-- 
                            Because the bin data are in fields in the table rather than being defined
                            within this class, it's a "lookup" operation.
                        -->
                        
                        <sp:Spectral_Lookup>
                            <sp:Bin_Center_Lookup>
                                <sp:bin_center_field_number_list>(3, 6, 9, 12)</sp:bin_center_field_number_list>
                            </sp:Bin_Center_Lookup>
                            <sp:Bin_Width_Lookup>
                                <sp:bin_width_field_number_list>(4, 7, 10, 13)</sp:bin_width_field_number_list>
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
            
            <!-- Tabulated-Flat Spectra -->
            
            <Table_Character>
                <name>Flat Spectra Table</name>
                <local_identifier>TabFlat</local_identifier>
                <offset unit="byte">0</offset>
                <records>1000</records>
                <description>
                    In this format, each row of the table contains a single spectrum, and the fields (columns) are defined without
                    the use of "Group_Field" classes.  This spectrum has only 4 points.
                </description>
                <record_delimiter>Carriage-Return Line-Feed</record_delimiter>
                <Record_Character>
                    <fields>13</fields>
                    <groups>0</groups>
                    <record_length unit="byte">82</record_length>
                    
                    <Field_Character>
                        <name>Target Name</name>
                        <field_number>1</field_number>
                        <field_location unit="byte">1</field_location>
                        <data_type>ASCII_String</data_type>
                        <field_length unit="byte">19</field_length>
                        <field_format>%-19s</field_format>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 1 Value</name>
                        <field_number>2</field_number>
                        <field_location unit="byte">20</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>DN</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 1 Center Wavelength</name>
                        <field_number>3</field_number>
                        <field_location unit="byte">25</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 1 FWHM</name>
                        <field_number>4</field_number>
                        <field_location unit="byte">30</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 2 Value</name>
                        <field_number>5</field_number>
                        <field_location unit="byte">35</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>DN</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 2 Center Wavelength</name>
                        <field_number>6</field_number>
                        <field_location unit="byte">40</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 2 FWHM</name>
                        <field_number>7</field_number>
                        <field_location unit="byte">45</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 3 Value</name>
                        <field_number>8</field_number>
                        <field_location unit="byte">50</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>DN</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 3 Center Wavelength</name>
                        <field_number>9</field_number>
                        <field_location unit="byte">55</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 3 FWHM</name>
                        <field_number>10</field_number>
                        <field_location unit="byte">60</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 4 Value</name>
                        <field_number>11</field_number>
                        <field_location unit="byte">65</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>DN</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 4 Center Wavelength</name>
                        <field_number>12</field_number>
                        <field_location unit="byte">70</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                    
                    <Field_Character>
                        <name>Point 4 FWHM</name>
                        <field_number>13</field_number>
                        <field_location unit="byte">75</field_location>
                        <data_type>ASCII_Integer</data_type>
                        <field_length unit="byte">4</field_length>
                        <field_format>%4d</field_format>
                        <unit>angstrom</unit>
                    </Field_Character>
                </Record_Character>
            </Table_Character>
            
        </File_Area_Observational>
    </Product_Observational>
