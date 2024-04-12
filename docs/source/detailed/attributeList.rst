Alphabetical List of Attributes
**************************************************

A complete list of all attributes in the Spectral (sp) Dictionary, in alphabetical
order, is available through the `PDS4 Data Dictionary <https://pds.nasa.gov/datastandards/documents/dd/current/PDS4_PDS_DD_1L00/webhelp/all/>`_
page, which is regenerated automatically with each release of the PDS4 Information Model.

To find the Spectral Discipline attribute list, look down the list of (alphabetically sorted) 
dictionary prefixes in the left menu for "Attributes in the sp namespace".
Select that item and the list of attributes will be presented on both the left and the
right as clickable links. 

Clicking on the specific attribute name will produce a grid with the full, formal
definition of the attribute, including data type, restrictions on values, and the
list of defined permissible values (if any) and their definitions. 

**Note** that attributes might appear as members of different classes, and that their 
definitions, or more likely their permissible values, might be context-dependent. 

Clicking on the class name in the title bar of the attribute grid will take you to 
the definition of the class containing that attribute.

If the attribute has an associated unit of measure type, that attribute *must* have
an XML attribute called "unit" in its tag when it is used. For example::

    <nh:tdi_rate unit="Hz">40.4694</nh:tdi_rate>
    
You can see valid values to use for the "unit=" XML attribute by clicking on the
value of "Unit of Measure Type" in the grid.
