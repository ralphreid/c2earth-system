SELECT
IFNULL(ProjectName1, "TBC") AS "project_name",
IFNULL(ProjectName2, "TBC") AS "project_name_alternate",
IFNULL(ProjectNumber, "TBC") AS "project_number",
IFNULL(ProjectPrefix, "TBC") AS "project_prefix",
IFNULL(ProjectDescription, "TBC") AS "description"

FROM all_project_information
ORDER BY project_name asc
