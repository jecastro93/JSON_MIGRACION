SELECT
	id_etp_comercializacion,
	JSON_ARRAYAGG(json_object("nom_aliado",
	id_aliado_comercial,
	"producto_comercializado",
	CASE
		WHEN producto IS null THEN null
		else JSON_EXTRACT (CONCAT("[", producto, "]"),
		"$")
	END,
	"otros",
	otro,
	"volumen",
	volumen,
	"municipio_origen",
	CAST(ruta AS SIGNED),
	"destino_nacional",
	CAST(destino_nacional AS SIGNED),
	"departamento",
	CASE
		WHEN id_depto IS null THEN null
		else JSON_EXTRACT (CONCAT("[", id_depto, "]"),
		"$")
	END,
	"municipio",
	CASE
		WHEN id_municipio IS null THEN null
		else JSON_EXTRACT (CONCAT("[", id_municipio, "]"),
		"$")
	END,
	"destino_internacional",
	destino))
FROM
	aliado_comercial_comercializacion
GROUP BY
	id_etp_comercializacion