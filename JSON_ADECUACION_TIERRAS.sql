SELECT
	id_cod_ficha,
	JSON_ARRAYAGG(json_object("riego",
	CAST(riego AS SIGNED),
	"tipo_riego",
	CAST(tipo_riego AS SIGNED),
	"drenaje",
	CAST(drenaje AS SIGNED),
	"municipio",
	CAST(municipio AS SIGNED),
	"veredas",
	CASE
		WHEN veredas IS null THEN null
		else JSON_EXTRACT (CONCAT("[", veredas, "]"),
		"$")
	END,
	"cobertura_ha",
	CAST(cobertua_ha AS SIGNED),
	"cobertura_productores",
	CAST(cobertura_productores AS SIGNED),
	"estado",
	CAST(estado AS SIGNED)))
FROM
	etp_produccion_adecuacion
GROUP BY
	id_cod_ficha