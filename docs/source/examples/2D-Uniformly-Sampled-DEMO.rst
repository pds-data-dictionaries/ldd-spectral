#######################################################################
2D Spectrum, Uniformly Sampled
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
           - Using <sp:Spectral_Characteristics> for a "2D" array spectrum;
           - Using the <sp:Rectangular_FOV> to describe the aperture; and
           - Using the <sp:Uniformaly_Sampled> class to document how to calculate the bin centers
             and provide a constant bin width.
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
                
                <!-- Uniformly Sampled Array Axis  -->
                
                <sp:Spectral_Characteristics>
                    <Local_Internal_Reference>
                        <local_identifier_reference>Spectrum2D</local_identifier_reference>
                        <local_reference_type>spectral_characteristics_to_array_object</local_reference_type>
                    </Local_Internal_Reference>
                    <sp:spectrum_format>2D</sp:spectrum_format>
                    <sp:spectral_bin_type>wavelength</sp:spectral_bin_type>
                    
                    <sp:Observation_Parameters>
                        <sp:number_of_exposures>1</sp:number_of_exposures>
                        <sp:net_integration_time unit="s">100</sp:net_integration_time>
                    </sp:Observation_Parameters>
                    
                    <sp:Field_of_View>
                        <sp:description>
                            This FOV in this case is a simple slit.  
                        </sp:description>
                        <sp:Rectangular_FOV>
                            <sp:width_angle unit="deg">0.01</sp:width_angle>
                            <sp:length_angle unit="deg">0.1</sp:length_angle>
                            <sp:celestial_north_position_angle unit="deg">47.6</sp:celestial_north_position_angle>
                            <sp:body_positive_pole_position_angle unit="deg">90</sp:body_positive_pole_position_angle>
                        </sp:Rectangular_FOV>
                    </sp:Field_of_View>
                    
                    <sp:Bin_Description>
                        <sp:bin_profile_description>
                            Bin widths are FWHM as described in the instrument documentation.
                        </sp:bin_profile_description>
                        <sp:Uniformly_Sampled_Wavelength>
                            <sp:axis_name>Sample</sp:axis_name>
                            <sp:sampling_interval_wavelength unit="nm">100</sp:sampling_interval_wavelength>
                            <sp:sampling_scale>Linear</sp:sampling_scale>
                            <sp:bin_width_wavelength unit="nm">100</sp:bin_width_wavelength>
                            <sp:first_center_wavelength unit="nm">3550</sp:first_center_wavelength>
                            <sp:last_center_wavelength unit="nm">3600</sp:last_center_wavelength>
                        </sp:Uniformly_Sampled_Wavelength>
                    </sp:Bin_Description>
                    
                </sp:Spectral_Characteristics>
                
            </Discipline_Area>
        </Observation_Area>
        
        <File_Area_Observational>
            <File>
                <file_name>No.Data</file_name>
            </File>
            
            <!-- 2D Spectrum -->
            
            <Array_2D_Spectrum>
                <local_identifier>Spectrum2D</local_identifier>
                <offset unit="byte">0</offset>
                <axes>2</axes>
                <axis_index_order>Last Index Fastest</axis_index_order>
                <Element_Array>
                    <data_type>SignedMSB4</data_type>
                </Element_Array>
                <Axis_Array>
                    <axis_name>Line</axis_name>
                    <elements>255</elements>
                    <sequence_number>1</sequence_number>
                </Axis_Array>
                <Axis_Array>
                    <axis_name>Sample</axis_name>
                    <elements>24</elements>
                    <sequence_number>2</sequence_number>
                </Axis_Array>
            </Array_2D_Spectrum>
    
        </File_Area_Observational>
    </Product_Observational>
