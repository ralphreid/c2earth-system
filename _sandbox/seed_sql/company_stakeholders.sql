SELECT
"tbc_structural" AS stakeholder_type,
StructuralCompany AS company,
StructuralEngineer AS stakeholder,
StructuralInfo AS stakeholder_info
FROM all_project_information
WHERE StructuralEngineer IS NOT NULL

UNION

SELECT
"tbc_civil" AS stakeholder_type,
CivilCompany AS company,
CivilEngineer AS stakeholder,
CivilInfo AS stakeholder_info
FROM all_project_information
WHERE CivilEngineer IS NOT NULL

UNION

SELECT
"survey_tbc" AS stakeholder_type,
SurveyCompany AS company,
Surveyor AS stakeholder,
SurveyorInfo AS stakeholder_info
FROM all_project_information
WHERE Surveyor IS NOT NULL

UNION

SELECT
"architectural_tbc" AS stakeholder_type,
ArchitectCompany AS company,
Architect AS stakeholder,
ArchitectInfo AS stakeholder_info
FROM all_project_information
WHERE Architect IS NOT NULL

UNION

SELECT
"attorney_tbc" AS stakeholder_type,
AttorneyCompany AS company,
Attorney AS stakeholder,
AttorneyInfo AS stakeholder_info
FROM all_project_information
WHERE Attorney IS NOT NULL
