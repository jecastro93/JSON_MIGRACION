SELECT
	id_organizaciones_region,
	id_ficha,
	JSON_ARRAYAGG(json_object("tipo_organizacion",
	tipo_de_organizacionasociacion_cooperativa_precooperativa,
	"tipo_organizacion_descripcion",
	CAST(tipo_de_organizacionasociacion_cooperativa_precooperativa AS SIGNED),
	"nom_organizacion",
	nombre_asociacion,
	"sigla",
	sigla,
	"otras_lineas_productivas",
	linea_productivasegun_ficha_diagnoistico,
	"fecha_creacion",
	fecha_de_creacion_mes_ano,
	"formalizada",
	CAST(formalizada AS SIGNED),
	"identificacion_organizacion",
	nit,
	"no_miembros",
	CAST(n_asociados AS SIGNED),
	"porc_hombres",
	CAST(hombres AS SIGNED),
	"porc_mujeres",
	CAST(mujeres AS SIGNED),
	"part_indigena",
	participacion_indigenas_si_no,
	"part_rom",
	participacion_rom_si_no,
	"part_raizales",
	raizales,
	"part_afro",
	participacion_afros_si_no,
	"part_palenqueros",
	palenqueros,
	"part_poblacion_campesina",
	poblacion_campesina,
	"municipio_sede",
	CAST(municipio_sede AS SIGNED),
	"sede_propia",
	sede_propia,
	"depto_cobertura",
	depotos_cobertura,
	"municipio_cobertura",
	municipios_cobertura,
	"nom_rep_legal",
	nombre_contacto,
	"tel_rep_legal",
	telefono,
	"email_rep_legal",
	correo,
	"num_cantidad_establecida",
	CAST(has_sembradas AS SIGNED),
	"unidad_medida_establecida",
	CAST(unidad_medida AS SIGNED),
	"num_cantidad_produccion",
	CAST(hasproduccion AS SIGNED),
	"unidad_medida_produccion",
	CAST(volumen_produccion_ton_ano AS SIGNED),
	"hace_transformacion",
	transformacion,
	"principal_producto_servicio",
	principal_producto_comercializado,
	"cantidad_numero",
	CAST(cantidad_transformacion AS SIGNED),
	"unidad_medida_producto",
	CAST(unidad_medida_transformacion AS SIGNED),
	"principales_aliados",
	principales_aliados_comerciales,
	"principal_necesidad_1",
	CASE
		WHEN principal_problema_1 IS null THEN null
		else JSON_EXTRACT (CONCAT("[", principal_problema_1, "]"),
		"$")
	END,
	"principal_necesidad_2",
	CASE
		WHEN principal_problema_2 IS null THEN null
		else JSON_EXTRACT (CONCAT("[", principal_problema_2, "]"),
		"$")
	END,
	"principal_necesidad_3",
	CASE
		WHEN principal_problema_3 IS null THEN null
		else JSON_EXTRACT (CONCAT("[", principal_problema_3, "]"),
		"$")
	END,
	"principal_necesidad_4",
	CASE
		WHEN principal_problema_4 IS null THEN null
		else JSON_EXTRACT (CONCAT("[", principal_problema_4, "]"),
		"$")
	END,
	"principal_necesidad_5",
	CASE
		WHEN principal_problema_5 IS null THEN null
		else JSON_EXTRACT (CONCAT("[", principal_problema_5, "]"),
		"$")
	END,
	"interactua_organizaciones",
	CAST(interactua_otras_org AS SIGNED),
	"nom_organizacion_interactua",
	nom_org_interaccion,
	"contacto_organizacion_interactua",
	contacto_interaccion,
	"proposito_interaccion",
	proposito_interaccion))
FROM
	organizaciones_region mpp
GROUP BY
	id_ficha