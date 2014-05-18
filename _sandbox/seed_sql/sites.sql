SELECT
-- 
CASE StructureType
WHEN "Barn/Water Tower" THEN "Barn or Water Tower"
WHEN "Pipeline (Water)" THEN "Pipeline for Water"
WHEN "Single-Family Home" THEN "Single Family Home"
WHEN "Condo/Townhouse" THEN "Condo or Townhouse"
ELSE IFNULL(StructureType,'TBC')
END AS StructureType,
StreetName,
City,
County,
LOC_PAGE,
LOC_LONG,
LOC_LAT,
APN,
TOMBROBOX,
Fault,
SiteNumber AS number

FROM all_project_information
-- WHERE StructureType = "Single-Family Home"
-- WHERE StructureType NOT IN ("Condo/Townhouse","Barn/Water Tower" )
ORDER BY StructureType ASC
-- LIMIT 300





