# ADR-002: Elección de la Base de Datos

## Metadatos

| Campo | Valor |
|-------|-------|
| **ID** | ADR-002 |
| **Título** | Elección de la base de datos |
| **Estado** | ✅ Aceptado |
| **Fecha** | 2026-03-11 |
| **Sprint** | sprint-1 |
| **Autores** | Equipo NewsRadar |
| **Revisores** | Product Owner, Scrum Master |

---

## Contexto

El sistema NewsRadar necesita almacenar:
- **100 canales RSS** con sus metadatos.
- **Artículos de noticias** obtenidos del crawling (volumen variable, sin esquema fijo).
- **Usuarios** (gestores y lectores) con credenciales y perfiles.
- **Alertas** (máximo 20 por gestor) con descriptores, expresiones cron y configuración.
- **Notificaciones** enviadas al buzón interno.
- **Estadísticas** para el panel de mando.

Los requisitos clave son:
- Esquema flexible para artículos (los campos RSS varían entre fuentes).
- Consultas de texto completo para el motor de alertas (descriptores de búsqueda).
- Capacidad para queries sobre grandes volúmenes de artículos.
- Facilidad de despliegue con Docker.

---

## Decisión

**Hemos decidido usar MongoDB** como base de datos principal del sistema.

---

## Alternativas Consideradas

### Alternativa 1: PostgreSQL (Relacional)
**Pros:**
- ACID completo, transacciones robustas.
- Muy maduro y bien conocido.
- Soporte nativo para búsqueda de texto completo (tsvector).
- Excelente soporte JSON (JSONB).

**Contras:**
- Esquema rígido menos adecuado para artículos RSS con campos variables.
- Más complejo de escalar horizontalmente.
- Requiere migraciones para cambios de esquema.

### Alternativa 2: ElasticSearch
**Pros:**
- Motor de búsqueda de texto completo de primera clase.
- Ideal para búsquedas complejas sobre grandes volúmenes.
- Kibana para visualización.
- Excelente para el análisis de noticias.

**Contras:**
- Más complejo de gestionar como base de datos principal.
- No es una BD de propósito general (requiere BD adicional para datos transaccionales).
- Mayor consumo de recursos.
- Curva de aprendizaje más pronunciada.

### Alternativa 3 (elegida): MongoDB
**Pros:**
- Esquema flexible (documentos JSON) ideal para artículos RSS heterogéneos.
- Motor de búsqueda de texto completo integrado (Atlas Search / índices de texto).
- Aggregation Pipeline para estadísticas del dashboard.
- Imagen Docker oficial y fácil integración en docker-compose.
- Excelente soporte en Python con Motor (async) y Beanie (ODM).
- Escalabilidad horizontal nativa.

**Contras:**
- No garantiza transacciones ACID multi-documento en todas las versiones.
- Menor soporte para joins complejos (se resuelve con Aggregation Pipeline).
- Requiere diseño cuidadoso de los documentos para evitar inconsistencias.

---

## Justificación

MongoDB es la opción óptima dado el carácter semi-estructurado de los datos RSS (distintas fuentes tienen distintos campos), el volumen variable de artículos y la necesidad de búsquedas de texto. Su Aggregation Pipeline es suficiente para las estadísticas del dashboard.

La integración con Python es excelente a través de `motor` (driver asíncrono) y `beanie` (ODM basado en Pydantic), que se alinea perfectamente con FastAPI.

---

## Consecuencias

### Positivas
- Flexibilidad para añadir/modificar campos de artículos sin migraciones.
- Consultas de texto completo nativas con índices de texto.
- Pipeline de agregación para estadísticas del dashboard.

### Negativas / Trade-offs
- El diseño de documentos es crítico; cambios posteriores pueden ser costosos.
- Sin transacciones multi-documento garantizadas (mitigable con diseño cuidadoso).

### Riesgos y mitigación
- **Riesgo:** Inconsistencia de datos en operaciones complejas. **Mitigación:** Diseñar el modelo de datos para minimizar operaciones multi-documento y usar transacciones MongoDB 4.x+ cuando sea necesario.
- **Riesgo:** Búsquedas de texto limitadas vs. ElasticSearch. **Mitigación:** Si el volumen de datos lo requiere, se puede añadir ElasticSearch en una fase posterior (ADR de revisión).

---

## Modelo de Datos Preliminar

```javascript
// Colección: channels (canales RSS)
{
  _id: ObjectId,
  url: String,          // URL del feed RSS
  name: String,
  category: String,     // Categoría IPTC primer nivel
  language: String,     // "es" | "en"
  active: Boolean,
  createdAt: Date
}

// Colección: articles (artículos)
{
  _id: ObjectId,
  channelId: ObjectId,
  title: String,
  content: String,
  url: String,
  publishedAt: Date,
  iptcCategory: String,
  keywords: [String],
  fetchedAt: Date
}

// Colección: users
{
  _id: ObjectId,
  email: String,
  passwordHash: String,
  role: "manager" | "reader",
  language: "es" | "en",
  createdAt: Date
}

// Colección: alerts
{
  _id: ObjectId,
  userId: ObjectId,
  name: String,
  descriptors: [String],   // palabras clave de búsqueda
  cronExpression: String,
  active: Boolean,
  createdAt: Date
}

// Colección: notifications
{
  _id: ObjectId,
  userId: ObjectId,
  alertId: ObjectId,
  title: String,
  content: String,
  read: Boolean,
  createdAt: Date
}
```

---

## Referencias

- [MongoDB Documentation](https://www.mongodb.com/docs/)
- [Beanie ODM for FastAPI](https://beanie-odm.dev/)
- [Motor – async MongoDB driver](https://motor.readthedocs.io/)
- Issue relacionado: Creado en Sprint 1
