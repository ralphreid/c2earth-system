SELECT DISTINCT *
FROM
 (
  SELECT DISTINCT
  ClientType AS client_type
  FROM ProjectsbyClientType
  WHERE ClientType IS NOT NULL

  UNION

  SELECT DISTINCT
  ClientType AS client_type
  FROM all_project_information
  WHERE ClientType IS NOT NULL

  UNION

  SELECT DISTINCT
  ClientType2 AS client_type
  FROM all_project_information
  WHERE ClientType2 IS NOT NULL
) as t
ORDER BY client_type
