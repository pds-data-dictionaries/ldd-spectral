.. 2024-04-11, by Anne Raugh

#########################################################
About the Example Labels
#########################################################

These "Demo" files provide simple demonstrations of how to use the Spectral dictionary
to describe a variety of spectral formats and bin description techniques. They 
have been designed to pass simple validation, so that they can be used as a starting
point for development and testing. Note, however, that these are far from being 
complete labels in any sense. In particular, the data structures would not be considered
"complete" by any conscientious reviewer without significant additional metadata - like
field descriptions, ranges and extrema, and so on.

The demo labels include:

- :doc:`1D spectrum, using \<Spectral_Lookup\> <1D-Lookup-DEMO>` to reference table fields, complex FOV
- :doc:`1D spectrum, using \<Uniformly_Sampled\> <1D-Uniformly-Sampled-DEMO>`, rectangular FOV
- :doc:`2D spectrum, using \<Uniformly_sampled\> <2D-Uniformly-Sampled-DEMO>`, rectangular FOV
- :doc:`3D spectrum, using \<Axis_Bin_Set\> <3D-Axis-Bin-Set-DEMO>`, rectangular FOV
- :doc:`3D spectrum, using \<Spectral_Lookup\> <3D-Lookup-DEMO>` to reference data objects in the same file, circular FOV
- :doc:`Tabulated-Flat spectra, using \<Spectral_Lookup\> <Tabulated-Flat-External-Lookup-DEMO>` to reference another product for bin centers and to specify unknown bin widths, rectangular FOV 
- :doc:`Tabulated-Flat spectra, using \<Spectral_Lookup\> <Tabulated-Flat-Local-Lookup-DEMO>` to reference fields using a list of field numbers, circular FOV
- :doc:`Tabulated-Parameter Groups spectra, using \<Spectral_Lookup\> <Tabulated-Param-Local-Lookup-DEMO>` to reference fields in *Group_Field* classes, rectangular FOV
- :doc:`Tabulated-Point Group spectra, using \<Spectral_Lookup\> <Tabulated-Point-Local-Lookup-DEMO>` to reference fields in a *Group_Field* class, complex FOV
- :doc:`Tabulated-Point Group spectra, using \<Spectral_Lookup\> <Tabulated-Point-Local-Width-Constant-DEMO>` to reference a field in a *Group_Field* class for bin center, and \<Bin_Width_Constant\> for bin width, complex FOV 