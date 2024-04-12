#######################################################################
3D Spectrum, Spectral Lookup
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
           - Using <sp:Spectral_Characteristics> for a "3D" array spectrum;
           - Using the <sp:Circular_FOV> to describe the aperture; and
           - Using the <sp:Spectral_Lookup> class to identify two data objects in the same file that
             provide pixel-by-pixel values for bin centers and bin widths. These might be, for 
             example, "back planes" of a spectral cube.
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
                
                <!-- Spectral Lookup for 3D spectra, internal -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>Cube</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_array_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>3D</sp:spectrum_format>
                    <sp:spectral_bin_type>frequency</sp:spectral_bin_type>
                    
                    <sp:Observation_Parameters>
                        <sp:number_of_exposures>2</sp:number_of_exposures>
                        <sp:net_integration_time unit="s">10</sp:net_integration_time>
                        <sp:resolution_limit_frequency unit="Hz">1</sp:resolution_limit_frequency>
                    </sp:Observation_Parameters>
                    
                    <sp:Field_of_View>
                        <sp:description>
                            This FOV is circular.
                        </sp:description>
                        <sp:Circular_FOV>
                            <sp:diameter_angle unit="deg">0.05</sp:diameter_angle>
                        </sp:Circular_FOV>
                    </sp:Field_of_View>
                    
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            Bin centers and widths are specified as part of the mission documentation,
                            specifically in the detector specifications [usually there would be some 
                            sort of reference here].
                        </sp:bin_profile_description>
                        <sp:Spectral_Lookup>
                            <sp:Bin_Center_Lookup>
                                <Local_Internal_Reference>
                                    <local_identifier_reference>BinCenterMap</local_identifier_reference>
                                    <local_reference_type>spectral_characteristics_to_bin_center_values</local_reference_type>
                                </Local_Internal_Reference>
                            </sp:Bin_Center_Lookup>
                            <sp:Bin_Width_Lookup>
                                <Local_Internal_Reference>
                                    <local_identifier_reference>BinWidthMap</local_identifier_reference>
                                    <local_reference_type>spectral_characteristics_to_bin_width_values</local_reference_type>
                                </Local_Internal_Reference>
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
    
            <!-- Spectral Cube -->
            
            <Array_3D_Spectrum>
                <local_identifier>Cube</local_identifier>
                <offset unit="byte">25000</offset>
                <axes>3</axes>
                <axis_index_order>Last Index Fastest</axis_index_order>
                <Element_Array>
                    <data_type>SignedLSB2</data_type>
                </Element_Array>
                <Axis_Array>
                    <axis_name>Spatial</axis_name>
                    <elements>100</elements>
                    <sequence_number>1</sequence_number>
                </Axis_Array>
                <Axis_Array>
                    <axis_name>Frequency</axis_name>
                    <elements>200</elements>
                    <sequence_number>2</sequence_number>
                </Axis_Array>
                <Axis_Array>
                    <axis_name>Time</axis_name>
                    <elements>255</elements>
                    <sequence_number>3</sequence_number>
                </Axis_Array>
            </Array_3D_Spectrum>
            
            <!-- Bin centers Map for spectral cube -->
            
            <Array_2D_Map>
                <local_identifier>BinCenterMap</local_identifier>
                <offset unit="byte">11000000</offset>
                <axes>2</axes>
                <axis_index_order>Last Index Fastest</axis_index_order>
                <Element_Array>
                    <data_type>IEEE754LSBSingle</data_type>
                </Element_Array>
                <Axis_Array>
                    <axis_name>Spatial</axis_name>
                    <elements>100</elements>
                    <sequence_number>1</sequence_number>
                </Axis_Array>
                <Axis_Array>
                    <axis_name>Frequency</axis_name>
                    <elements>200</elements>
                    <sequence_number>2</sequence_number>
                </Axis_Array>
            </Array_2D_Map>
            
            <!-- Bin width map for specral cube -->
            
            <Array_2D_Map>
                <local_identifier>BinWidthMap</local_identifier>
                <offset unit="byte">12000000</offset>
                <axes>2</axes>
                <axis_index_order>Last Index Fastest</axis_index_order>
                <Element_Array>
                    <data_type>IEEE754LSBSingle</data_type>
                </Element_Array>
                <Axis_Array>
                    <axis_name>Spatial</axis_name>
                    <elements>100</elements>
                    <sequence_number>1</sequence_number>
                </Axis_Array>
                <Axis_Array>
                    <axis_name>Frequency</axis_name>
                    <elements>200</elements>
                    <sequence_number>2</sequence_number>
                </Axis_Array>
            </Array_2D_Map>
    
        </File_Area_Observational>
    </Product_Observational>
