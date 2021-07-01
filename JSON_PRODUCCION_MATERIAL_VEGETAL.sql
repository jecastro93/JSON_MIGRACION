SELECT
	id_etp_produccion,
	JSON_ARRAYAGG(json_object("produce_plantula",
	CAST(produccion AS SIGNED),
	"material",
	CAST(vivero AS SIGNED),
	"infraestructura",
	CAST(ubicacion_en_el_municipio AS SIGNED),
	"departamento",
	CAST(id_departamento_ubicacion AS SIGNED),
	"municipio",
	CAST(id_municipio_ubicacion AS SIGNED),
	"identificacion",
	CAST(identificacion AS SIGNED),
	"registro_ica",
	CAST(certificacion AS SIGNED),
	"capacidad_anio",
	CAST(capacidad AS SIGNED),
	"contacto",
	contacto,
	"telefono",
	telefono,
	"correo",
	correo))
FROM
	produccion_vegetal
GROUP BY
	id_etp_produccion