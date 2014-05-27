SELECT DISTINCT
IFNULL(ProjectName1, "TBC") AS "name",
IFNULL(ProjectName2, "TBC") AS "name_alternate",
IFNULL(ProjectNumber, "TBC") AS "number",
IFNULL(ProjectPrefix, "TBC") AS "prefix",
IFNULL(ProjectDescription, "TBC") AS "description"

FROM all_project_information
ORDER BY name asc
