SELECT
	ficha,
	JSON_ARRAYAGG(json_object("meta",
	CAST(meta AS SIGNED),
	"rango1",
	CAST(rango1 AS SIGNED),
	"rango2",
	CAST(rango2 AS SIGNED),
	"rango3",
	CAST(rango3 AS SIGNED),
	"tipo_infraestructura",
	CASE
		WHEN tipo_infraestructura IS null THEN null
		else JSON_EXTRACT (CONCAT("[", tipo_infraestructura, "]"),
		"$")
	END,
	"dotacion",
	CAST(dotacion AS SIGNED),
	"nombre",
	nombre))
FROM
	proyeccion_infraestructuras_mixtas
GROUP BY
	ficha