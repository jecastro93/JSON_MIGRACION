SELECT
	id_etp_extension,
	JSON_ARRAYAGG(json_object("entidad_responsable",
	nombre,
	"entidad_financiadora",
	CAST(entidad_financiador AS SIGNED),
	"cobertura_2018",
	CAST(cobertura_1 AS SIGNED),
	"cobertura_2019",
	CAST(cobertura_2 AS SIGNED),
	"contacto",
	persona_contacto,
	"telefono",
	telefono_contacto,
	"num_asistentes",
	CAST(numero_asistentes AS SIGNED),
	"oportunidad",
	CAST(oportunidad AS SIGNED),
	"calidad_servicio",
	CAST(calidad_servicio AS SIGNED),
	"cobertura",
	CAST(cobertura AS SIGNED)))
FROM
	entidad_asistencia_tecnica
GROUP BY
	id_etp_extension