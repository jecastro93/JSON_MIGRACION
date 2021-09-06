SELECT
	id_etp_produccion,
	JSON_ARRAYAGG(json_object("tipo_registro",
	CAST(tipo_2 AS SIGNED),
	"administracion",
	administracion,
	"tipo_maquinaria",
	CAST(tipo AS SIGNED),
	"cantidad",
	CAST(cantidad AS SIGNED),
	"acceso",
	CAST(acceso AS SIGNED),
	"suficiencia",
	CAST(suficiencia AS SIGNED),
	"estado",
	CAST(estado AS SIGNED)))
FROM
	maquinaria_verde_ganaderia_detalle
GROUP BY
	id_etp_produccion