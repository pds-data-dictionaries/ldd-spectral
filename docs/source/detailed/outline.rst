Spectral/Spectroscopy Discipline Namespace Outline
######################################################

*<sp:Spectral_Characteristics>* is the public entry point to the Spectral Discipline 
namespace. This class contains all other Spectral classes and must be included to gain
access to them. Below is a summary outline of all classes and attributes 
currently available in the Spectral Discipline dictionary, in the order in which they 
would appear in a label if every single one was used. 

Note that there are no real cases in which every single discipline class and 
attribute would appear in a single label. The point of this outline is primarily
to catalog what is present and show the required ordering within classes when
they are included in a label.

**Note:** The abbreviated form "(Energy|Frequency|Wavelength|Wavenumber)" is used for
those parallel classes that have identical structure but names that are tied to the 
requirements for units of measure. The form used must be consistent with the value
of the *sp:spectral_bin_type>* attribute.

::

  <sp:Spectral_Characteristics>
      <pds:Local_Internal_Reference>
          <pds:comment>
          <pds:local_identifier_reference>
          <pds:local_reference_type>
          
      <sp:description>
      <sp:spectrum_format>
      <sp:value_field_name>
      <sp:value_field_number_list>
      <sp:spectral_bin_type>
      
      <sp:Observation_Parameters>
          <sp:number_of_exposures>
          <sp:net_integration_time>
          <sp:resolution_limit_(energy|frequency|wavelength|wavenumber)>
          <sp:solar_analog_star_name>
          <sp:absolute_calibration_star_name>
          <sp:comment>
          
      <sp:Field_of_View>
          <sp:description>
          
          <sp:Circular_FOV>
              <sp:diameter_angle>
              
          <sp:Rectangular_FOV>
              <sp:width_angle>
              <sp:length_angle>
              <sp:celestial_north_pole_angle>
              <sp:body_positive_pole_angle>
              
          <sp:Complex_FOV>
              <sp:width_angle>
              <sp:length_angle>
              <sp:celestial_north_pole_angle>
              <sp:body_positive_pole_angle>

          <pds:Internal_Reference>
              <pds:lid_reference> *or* <pds:lidvid_reference>
              <pds:reference_type>
              <pds:comment>
              
      <sp:Bin_Description>
          <sp:bin_profile_description>
          
          <sp:Uniformly_Sampled_(Energy|Frequency|Wavelength|Wavenumber)>
              <sp:axis_name>
              <sp:sampling_interval_(energy|frequency|wavelength|wavenumber)>
              <sp:sampling_scale>
              <sp:sampling_base>
              <sp:bin_width_(energy|frequency|wavelength|wavenumber)>
              <sp:first_center_(energy|frequency|wavelength|wavenumber)>
              <sp:last_center_(energy|frequency|wavelength|wavenumber)>  
              <sp:comment>
              
          <sp:Axis_Bin_Set_(Energy|Frequency|Wavelength|Wavenumber)>
              <sp:axis_name>
              <sp:Bin_(Energy|Frequency|Wavelength|Wavenumber)>
                  <sp:bin_sequence_number>
                  <sp:center_(energy|frequency|wavelength|wavenumber)>
                  <sp:bin_width_(energy|frequency|wavelength|wavenumber)>
                  <sp:detector_number>
                  <sp:grating_position>
                  <sp:original_bin_number>
                
                  <sp:Filter>
                      <sp:filter_name>
                      <sp:filter_number>
                      <sp:comment>
                
          <sp:Spectral_Lookup>
              <sp:Bin_Center_Lookup>
                  <sp:bin_center_field_name>
                  <sp:bin_center_field_number_list>
                  
                  <pds:Local_Internal_Reference>
                      <pds:comment>
                      <pds:local_identifier_reference>
                      <pds:local_reference_type>
                  
                  <pds:Internal_Reference>
                      <pds:lid_reference> *or* <pds:lidvid_reference>
                      <pds:reference_type>
                      <pds:comment>
                      
              <sp:Bin_Width_Constant>
                  <sp:bin_width_(energy|frequency|wavelength|wavenumber)>
                  
              <sp:Bin_Width_Lookup>
                  <sp:bin_width_field_name>
                  <sp:bin_width_field_number_list>
    
                  <pds:Local_Internal_Reference>
                      <pds:comment>
                      <pds:local_identifier_reference>
                      <pds:local_reference_type>
                  
                  <pds:Internal_Reference>
                      <pds:lid_reference> *or* <pds:lidvid_reference>
                      <pds:reference_type>
                      <pds:comment>

              <sp:comment>