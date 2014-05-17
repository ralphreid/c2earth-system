SELECT
"buyer_realestate" AS stakeholder_type,
RealestateBuyer AS stakeholder
FROM all_project_information
WHERE RealestateBuyer IS NOT NULL

UNION

SELECT
"buyer_agent" AS stakeholder_type,
AgentBuyer AS stakeholder
FROM all_project_information
WHERE AgentBuyer IS NOT NULL

UNION

SELECT
"buyer_info" AS stakeholder_type,
BuyerInfo AS stakeholder
FROM all_project_information
WHERE BuyerInfo IS NOT NULL

UNION

SELECT
"seller_realestate" AS stakeholder_type,
RealestateSeller AS stakeholder
FROM all_project_information
WHERE RealestateSeller IS NOT NULL

UNION

SELECT
"seller_agent" AS stakeholder_type,
AgentSeller AS stakeholder
FROM all_project_information
WHERE AgentSeller IS NOT NULL

UNION

SELECT
"seller_info" AS stakeholder_type,
SellerInfo AS stakeholder
FROM all_project_information
WHERE SellerInfo IS NOT NULL
