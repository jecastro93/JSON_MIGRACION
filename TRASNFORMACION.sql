SELECT
	id_ficha,
	JSON_ARRAYAGG(json_object("planta",
	planta,
	"estado",
	CAST(estado AS SIGNED),
	"capacidad",
	CAST(capacidad AS SIGNED),
	"produccion",
	CAST(capacidad_transformacion AS SIGNED),
	"cantidad",
	CAST(cantidad_producida AS SIGNED),
	"geolocalizacion",
	ubicacion))
FROM
	etp_transformacion
GROUP BY
	id_ficha