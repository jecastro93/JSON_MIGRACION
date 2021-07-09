SELECT
	ficha_cod,
	JSON_ARRAYAGG(json_object("nom_centro_acopio",
	nombre,
	"propietario",
	propietario,
	"capacidad_almacenamiento",
	capacidad,
	"cobertura_productores",
	CAST(cobertura AS SIGNED),
	"estado",
	CAST(estado AS SIGNED),
	"geolocalizacion",
	ubicacion))
FROM
	centro_de_venta
GROUP BY
	ficha_cod