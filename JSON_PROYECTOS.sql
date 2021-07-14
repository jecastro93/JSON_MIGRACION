SELECT
	id_ficha,
	JSON_ARRAYAGG(json_object("tipo_prpyecto",
	CAST(tipo AS SIGNED),
	"entidad_responsable",
	entidad_responsable,
	"objeto",
	objeto,
	"valor",
	CAST(valor AS SIGNED),
	"num_beneficiario",
	CAST(numero_beneficiarios AS SIGNED)))
FROM
	proyectos
GROUP BY
	id_ficha