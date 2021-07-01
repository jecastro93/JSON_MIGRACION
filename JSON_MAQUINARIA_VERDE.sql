SELECT
	id_etp_produccion,
	JSON_ARRAYAGG(json_object("tipo_maquinaria",
	CAST(tipo AS SIGNED),
	"estado",
	CAST(estado AS SIGNED),
	"acceso",
	CAST(acceso AS SIGNED),
	"suficiencia",
	CAST(suficiencia AS SIGNED),
	"ubicacion",
	ubicacion))
FROM
	maquinaria_verde
GROUP BY
	id_etp_produccion
    