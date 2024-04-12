#############################################################################################
Tabulated-Parameter Groups Spectrum, internal Spectral Lookup
#############################################################################################

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
           - Using <sp:Spectral_Characteristics> for a spectral table in the 
             "Tabulated-Paramater Groups" fornat;
           - Using the <sp:Rectangular_FOV> to describe the aperture; and
           - Using the <sp:Spectral_Lookup> class to identify bin centers and widths as fields 
             within their respective Group_Field class.
    
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
                
                <!-- Tabulated-Parameter Groups -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>TabParamGroups</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_table_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>Tabulated-Parameter Groups</sp:spectrum_format>
                    <sp:value_field_name>Counts</sp:value_field_name>
                    <sp:spectral_bin_type>frequency</sp:spectral_bin_type>
                    <sp:Field_of_View>
                        <sp:description>
                            This is what a rectangular field of view looks like.  Note that it is still
                            defined in terms of angular measurements on the sky.  You can specify the
                            orientation of the aperture with respect to either the pole of the body 
                            observerd or celestial north. This is not required, but if the orientation 
                            is known, it should be provided for completeness.
                        </sp:description>
                        <sp:Rectangular_FOV>
                            <sp:width_angle unit="arcmin">3.5</sp:width_angle>
                            <sp:length_angle unit="arcmin">5.0</sp:length_angle>
                            <sp:celestial_north_position_angle unit="deg">72</sp:celestial_north_position_angle>
                        </sp:Rectangular_FOV>
                    </sp:Field_of_View>
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            This is where you describe HOW the bin profiles were determined/defined.
                        </sp:bin_profile_description>
                        <sp:Spectral_Lookup>
                            <!--
                                NOTE in particular that the value for bin_center/width_field_name is the
                                     value of the <name> field in the <Field_Binary> class, NOT the <name>
                                     in the <Group_Field_Binary> class (if any).
                            -->
                            <sp:Bin_Center_Lookup>
                                <sp:bin_center_field_name>Bin Center</sp:bin_center_field_name>
                            </sp:Bin_Center_Lookup>
                            <sp:Bin_Width_Lookup>
                                <sp:bin_width_field_name>Bin Width</sp:bin_width_field_name>
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
    
            <!-- Tabulated-Parameter Groups -->
            
            <Table_Binary>
                <name>Grouped Parameters Spectra Table</name>
                <local_identifier>TabParamGroups</local_identifier>
                <offset unit="byte">0</offset>
                <records>132</records>
                <description>
                    This table contains one spectrum per row, but the values for intensity, error, bin center, and bin width occur 
                    in contiguous groups within the row.  So each row first lists all the observed counts, then all the errors, etc.
                    
                    In this case each group MUST contain only a single parameter, but there may be additional groups (unrelated to
                    spectral parameters) within the record.
                </description>
                
                <Record_Binary>
                    <fields>2</fields>
                    <groups>4</groups>
                    <record_length unit="byte">1500</record_length>
                    
                    <Field_Binary>
                        <name>Target</name>
                        <field_location unit="byte">1</field_location>
                        <data_type>ASCII_String</data_type>
                        <field_length unit="byte">30</field_length>
                    </Field_Binary>
                    
                    <Field_Binary>
                        <name>Date Observed</name>
                        <field_location unit="byte">31</field_location>
                        <data_type>ASCII_Date_YMD</data_type>
                        <field_length unit="byte">10</field_length>
                    </Field_Binary>
                    
                    <Group_Field_Binary>
                        <name>Spectrum</name>
                        <repetitions>50</repetitions>
                        <fields>1</fields>
                        <groups>0</groups>
                        <description>
                            This array contains the observed values at each point in the spectrum.
                        </description>
                        <group_location unit="byte">41</group_location>
                        <group_length unit="byte">100</group_length>
                        <Field_Binary>
                            <name>Counts</name>
                            <field_location unit="byte">1</field_location>
                            <data_type>UnsignedMSB2</data_type>
                            <field_length unit="byte">2</field_length>
                            <unit>DN</unit>
                        </Field_Binary>
                    </Group_Field_Binary>
                    
                    <Group_Field_Binary>
                        <name>Error</name>
                        <repetitions>50</repetitions>
                        <fields>1</fields>
                        <groups>0</groups>
                        <group_location unit="byte">141</group_location>
                        <group_length unit="byte">100</group_length>
                        <Field_Binary>
                            <name>OneSigma</name>
                            <field_location unit="byte">1</field_location>
                            <data_type>UnsignedMSB2</data_type>
                            <field_length unit="byte">2</field_length>
                            <unit>DN</unit>
                        </Field_Binary>
                    </Group_Field_Binary>
                    
                    <Group_Field_Binary>
                        <name>Center Frequency</name> <!-- This is NOT the name to use in <sp:bin_center_field_name>. -->
                        <repetitions>50</repetitions>
                        <fields>1</fields>
                        <groups>0</groups>
                        <group_location unit="byte">241</group_location>
                        <group_length unit="byte">200</group_length>
                        <Field_Binary>
                            <name>Bin Center</name> <!-- THIS is the name to use in <sp:bin_center_field_name>. It must be present. -->
                            <field_location unit="byte">1</field_location>
                            <data_type>IEEE754MSBSingle</data_type>
                            <field_length unit="byte">4</field_length>
                            <unit>Hz</unit>
                        </Field_Binary>
                    </Group_Field_Binary>
                    
                    <Group_Field_Binary>
                        <name>FWHM</name> <!-- This is NOT the name to use in <sp:bin_width_field_name>. -->
                        <repetitions>50</repetitions>
                        <fields>1</fields>
                        <groups>0</groups>
                        <group_location unit="byte">441</group_location>
                        <group_length unit="byte">200</group_length>
                        <Field_Binary>
                            <name>Bin Width</name> <!-- THIS is the name to use in <sp:bin_width_field_name>. It must be present. -->
                            <field_location unit="byte">1</field_location>
                            <data_type>IEEE754MSBSingle</data_type>
                            <field_length unit="byte">4</field_length>
                            <unit>Hz</unit>
                        </Field_Binary>
                    </Group_Field_Binary>
                </Record_Binary>
            </Table_Binary>
            
        </File_Area_Observational>
    </Product_Observational>
