#######################################################################
1D Spectrum, Uniformly Sampled
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
        to be inadequate without appropriate descriptions, extrema, null data indicates, and similar
        essential metadata.
    
        This label demonstrates:
           - Using <sp:Spectral_Characteristics> for a "1D" table spectrum;
           - Using the <sp:Rectangular_FOV> to describe the aperture; and
           - Using the <sp:Uniformly_Sampled> class to provide the information needed to calculate
             bin centers.
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
                
                <!-- Telescope Spectrum, uniformly sampled bins -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>TableChar1D</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_table_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:description>
                        This is a linear spectrum - presented as a table where each point in the spectrum
                        (usually along with associated information) is contained in a single row of the table.
                        In this case it is necessary to specify the name of the field that contains the actual
                        measured datum.
                    </sp:description>
                    <sp:spectrum_format>1D</sp:spectrum_format>
                    <sp:value_field_name>Intensity</sp:value_field_name>
                    <sp:spectral_bin_type>wavelength</sp:spectral_bin_type>
                                    
                    <sp:Observation_Parameters>
                        <sp:number_of_exposures>1</sp:number_of_exposures>
                        <sp:net_integration_time unit="s">10</sp:net_integration_time>
                        <sp:resolution_limit_wavelength unit="micrometer">10</sp:resolution_limit_wavelength>
                        <sp:solar_analog_star_name>Billy</sp:solar_analog_star_name>
                    </sp:Observation_Parameters>
                    
                    <sp:Field_of_View>
                        <sp:description>
                            Tbe FOV is a simple slit.
                        </sp:description>
                        <sp:Rectangular_FOV>
                            <sp:width_angle unit="deg">0.01</sp:width_angle>
                            <sp:length_angle unit="deg">0.06</sp:length_angle>
                            <sp:celestial_north_position_angle unit="deg">23</sp:celestial_north_position_angle>
                        </sp:Rectangular_FOV>
                    </sp:Field_of_View>
                    
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            Bin centers and bandpasses included in the table were copied from the
                            instrument manual.
                        </sp:bin_profile_description>
                        <sp:Uniformly_Sampled_Wavelength>
                            <sp:axis_name>Row</sp:axis_name>
                            <sp:sampling_interval_wavelength unit="nm">100</sp:sampling_interval_wavelength>
                            <sp:sampling_scale>Linear</sp:sampling_scale>
                            <sp:bin_width_wavelength unit="nm">10</sp:bin_width_wavelength>
                            <sp:first_center_wavelength unit="nm">350</sp:first_center_wavelength>
                            <sp:last_center_wavelength unit="nm">480</sp:last_center_wavelength>
                        </sp:Uniformly_Sampled_Wavelength>
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
                <offset unit="byte">26000000</offset>
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
