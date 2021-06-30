SELECT
	id_cod_ficha,
	JSON_ARRAYAGG(json_object("PLAGAS",
	CASE
		WHEN id_problema_sanitario IS null THEN null
		else JSON_EXTRACT (CONCAT("[", id_problema_sanitario, "]"),
		"$")
	END,
	"OTRA_PLAGAS",
	otro1,
	"ENFERMEDADES",
	CASE
		WHEN enfermedad IS null THEN null
		else JSON_EXTRACT (CONCAT("[", enfermedad, "]"),
		"$")
	END,
	"OTRAS_ENFERMEDADES",
	otro2,
	"PROBLEMAS",
	CASE
		WHEN otros_problemas IS null THEN null
		else JSON_EXTRACT (CONCAT("[", otros_problemas, "]"),
		"$")
	END,
	"OTROS_PROBLEMAS",
	otro3))
FROM
	etp_produccion_problemass_sanitarios
GROUP BY
	id_cod_ficha