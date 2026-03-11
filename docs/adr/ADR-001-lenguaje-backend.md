# ADR-001: Elección del Lenguaje para el Backend

## Metadatos

| Campo | Valor |
|-------|-------|
| **ID** | ADR-001 |
| **Título** | Elección del lenguaje para el backend |
| **Estado** | ✅ Aceptado |
| **Fecha** | 2026-03-11 |
| **Sprint** | sprint-1 |
| **Autores** | Equipo NewsRadar |
| **Revisores** | Product Owner, Scrum Master |

---

## Contexto

El proyecto NewsRadar requiere un backend capaz de:
- Exponer una API REST documentada (evaluación automatizada vía API).
- Ejecutar un crawler RSS periódico.
- Procesar y clasificar noticias según IPTC Media Topics.
- Gestionar alertas con expresiones cron.
- Integrarse con servicios de IA generativa.
- Desplegarse en contenedores Docker.

El equipo tiene experiencia variada; se valoran la productividad, el ecosistema de librerías para scraping/crawling, y la facilidad de integración con bases de datos NoSQL.

---

## Decisión

**Hemos decidido usar Python 3.11 con el framework FastAPI** como lenguaje y framework principal del backend.

---

## Alternativas Consideradas

### Alternativa 1: Node.js con Express/NestJS
**Pros:**
- Gran ecosistema npm.
- Asincronía nativa con async/await.
- Mismo lenguaje que el frontend (si se usa React).

**Contras:**
- Gestión de dependencias más compleja.
- Menos librerías maduras para NLP/IA que Python.
- Tipado opcional (TypeScript añade complejidad).

### Alternativa 2: Java con Spring Boot
**Pros:**
- Muy robusto y maduro para APIs REST.
- Tipado estático fuerte.
- Buen soporte para sistemas empresariales.

**Contras:**
- Mayor verbosidad y curva de aprendizaje.
- Arranque más lento (JVM).
- Menor integración con librerías de IA/ML.

### Alternativa 3 (elegida): Python 3.11 con FastAPI
**Pros:**
- Generación automática de documentación OpenAPI (Swagger UI).
- Excelente ecosistema para scraping (feedparser, beautifulsoup4).
- Primera clase para integración con IA (openai, langchain).
- Rendimiento asíncrono nativo con asyncio.
- Tipado con Pydantic para validación automática de datos.
- Despliegue ligero en contenedores.

**Contras:**
- GIL puede limitar el paralelismo en tareas CPU-intensivas.
- Menos maduro que Spring Boot para sistemas empresariales grandes.

---

## Justificación

Python con FastAPI ofrece el mejor equilibrio entre productividad del equipo, facilidad de integración con IA/ML, y la capacidad de generar documentación OpenAPI automáticamente (clave para la evaluación automatizada del proyecto).

FastAPI es uno de los frameworks más rápidos de Python (basado en Starlette/uvicorn) y su sistema de validación con Pydantic reduce significativamente el código boilerplate.

---

## Consecuencias

### Positivas
- Documentación OpenAPI generada automáticamente en `/docs`.
- Integración directa con librerías de scraping y IA.
- Menos código, mayor productividad.

### Negativas / Trade-offs
- El equipo debe familiarizarse con Pydantic y la programación asíncrona.
- Python no es tan rápido como Node.js o Java para I/O intensivo puro.

### Riesgos y mitigación
- **Riesgo:** GIL limita el paralelismo. **Mitigación:** Usar Celery/APScheduler para tareas en background (crawler, alertas cron).

---

## Referencias

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [Pydantic Documentation](https://docs.pydantic.dev/)
- Issue relacionado: Creado en Sprint 1
