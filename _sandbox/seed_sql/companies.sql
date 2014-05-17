SELECT
"structural_engineering" AS company_type,
StructuralCompany AS company
FROM all_project_information
WHERE StructuralCompany IS NOT NULL

Union

SELECT
"civil_engineering" AS company_type,
CivilCompany AS company
FROM all_project_information
WHERE StructuralCompany IS NOT NULL

UNION

SELECT
"surveying" AS company_type,
SurveyCompany AS company
FROM all_project_information
WHERE SurveyCompany IS NOT NULL

UNION

SELECT
"architecture" AS company_type,
ArchitectCompany AS company
FROM all_project_information
WHERE ArchitectCompany IS NOT NULL

UNION

SELECT
"legal" AS company_type,
AttorneyCompany AS company
FROM all_project_information
WHERE AttorneyCompany IS NOT NULL
