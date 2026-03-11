# ADR-002: Selección de Base de Datos

## Estado

Aceptado

## Fecha

2026-03-11

## Contexto

El sistema necesita almacenar:
- **Canales RSS**: hasta 100 canales con metadatos (URL, categoría IPTC, frecuencia de actualización).
- **Noticias**: artículos con título, descripción, enlace, fecha, categorías IPTC, palabras clave.
- **Alertas**: hasta 20 por gestor, con descriptores, expresiones cron y configuración de notificaciones.
- **Usuarios**: con roles (lector / gestor / administrador) y configuraciones personales.

El esquema de las noticias puede variar según el canal RSS y evolucionar a lo largo del proyecto.

## Opciones Consideradas

### MongoDB
- Base de datos documental NoSQL.
- Esquema flexible, ideal para noticias RSS con campos variables.
- Excelente integración con Python (Motor, PyMongo).
- Búsqueda de texto completo nativa.

### PostgreSQL
- Base de datos relacional ACID.
- Esquema rígido, requiere migraciones para cambios.
- Muy madura y robusta para datos relacionales.
- Extensión `pg_trgm` para búsqueda de texto.

### ElasticSearch
- Motor de búsqueda y análisis.
- Ideal para búsquedas de texto complejas y agregaciones.
- Más complejo de operar y mantener.
- No es una BD primaria adecuada por sí sola.

## Decisión

**MongoDB** como base de datos principal.

La naturaleza variable de los feeds RSS, la necesidad de almacenar documentos JSON complejos y la flexibilidad para evolucionar el esquema durante el desarrollo hacen de MongoDB la opción más adecuada. La integración con Python es sencilla a través de Motor (cliente asíncrono compatible con FastAPI).

## Consecuencias

### Positivas
- Esquema flexible: añadir campos a las noticias no requiere migraciones.
- Consultas de texto completo nativas con índices de texto.
- Fácil integración con FastAPI mediante Motor (async).
- Un único contenedor Docker cubre todas las necesidades de persistencia.

### Negativas
- Sin transacciones ACID completas en versiones antiguas (disponibles desde MongoDB 4.0).
- El equipo debe aprender a diseñar esquemas de documentos en lugar de tablas.
- Las consultas agregadas complejas son más verbosas que SQL.
