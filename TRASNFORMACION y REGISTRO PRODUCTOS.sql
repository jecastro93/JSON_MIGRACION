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
	ubicacion,
	"productos",
	(
	SELECT
		JSON_ARRAYAGG(json_object("producto",
		CAST(p.producto AS SIGNED),
		"otro",
		p.otro,
		"cantidad",
		CAST(p.cantidad AS SIGNED),
		"unidad_medida",
		CAST(p.unidad_medida AS SIGNED),
		"tipo_transformacion",
		CAST(p.tipo_transformacion AS SIGNED),
		"reg_invima",
		CAST(p.invima AS SIGNED)))
	FROM
		agricolas_transformacion_detalle p
	WHERE
		p.ficha = t.id_ficha)))
FROM
	etp_transformacion t
GROUP BY
	id_ficha