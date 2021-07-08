SELECT
	id_ficha,
	JSON_ARRAYAGG(json_object("sello",
	CAST(respuesta AS SIGNED),
	"otros",
	otro,
	"nom_sello",
	detalle,
	"productores",
	cantidad))
FROM
	etp_comercializacion
GROUP BY
	id_ficha