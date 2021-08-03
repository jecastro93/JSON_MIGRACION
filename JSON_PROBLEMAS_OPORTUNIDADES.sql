SELECT
	id_ficha,
	JSON_ARRAYAGG(json_object("tipo",
	CAST(tipo_retos_oportunidades AS SIGNED),
	"componente",
	componente,
	"principal_problemas",
	CASE
		WHEN reto IS null THEN null
		else JSON_EXTRACT (CONCAT("[", reto, "]"),
		"$")
	END,
	"otro_problema",
	otro,
	"principal_oportunidad",
	CASE
		WHEN oportunidad IS null THEN null
		else JSON_EXTRACT (CONCAT("[", oportunidad, "]"),
		"$")
	END,
	"otra_oportunidad",
	otro))
FROM
	retos_oportunidades
WHERE id_ficha IN (SELECT cod_unico_mesa FROM mesasxlinea_productiva WHERE id_grupo_ficha = 1 OR id_grupo_ficha = 2)
GROUP BY
	id_ficha