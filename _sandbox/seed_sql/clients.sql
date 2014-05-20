SELECT
IFNULL(ClientType,"TBC") AS client_type,
IFNULL(ClientType2, "TBC") AS client_type2,
ClientName AS name,
ClientName2 AS name_alternate,
ClientAddress AS address,
ClientCity AS city,
ClientState AS state,
ClientZip AS zip,
ClientWorkPhone AS work_phone,
ClientHomePhone AS home_phone,
ClientCellPhone AS cell_phone,
ClientFaxPhone AS fax_phone,
ClientEmail AS email,
ClientAddress2 AS address_alternate,
ClientCity2 AS city_alternate,
ClientState2 AS state_alternate,
ClientZip2 AS zip_alternate,
ClientWorkPhone2 AS work_phone_alternate,
ClientHomePhone2 AS home_phone_alternate,
ClientCellPhone2 AS cell_phone_alternate,
ClientFaxPhone2 AS fax_phone_alternate,
ClientEmail2 AS email_alternate,
CONCAT(ClientNote," ", ClientNote2) AS note
FROM all_project_information


