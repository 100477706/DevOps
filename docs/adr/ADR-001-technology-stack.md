# ADR-001: Selección del Stack Tecnológico

## Estado

Aceptado

## Fecha

2026-03-11

## Contexto

El proyecto NewsRadar requiere un sistema capaz de:
- Exponer una API REST documentada para evaluación automatizada.
- Crawlear y almacenar noticias de hasta 100 canales RSS.
- Gestionar alertas con expresiones cron.
- Enviar notificaciones por correo electrónico.
- Ofrecer un panel de control interactivo.

Se necesita un stack moderno, con buena documentación, ecosistema activo y que permita un desarrollo ágil dentro de los plazos del proyecto.

## Opciones Consideradas

| Capa | Opción A | Opción B | Opción C |
|------|----------|----------|----------|
| Backend | Python + FastAPI | Node.js + Express | Java + Spring Boot |
| Base de datos | MongoDB | PostgreSQL | ElasticSearch |
| Frontend | React | Angular | Vue.js |

## Decisión

**Backend: Python 3.11 + FastAPI**
- FastAPI genera documentación OpenAPI (Swagger) automáticamente, imprescindible dado el requisito de evaluación via API.
- Python tiene excelentes librerías para parsing RSS (`feedparser`), procesamiento de texto y ML/IA.
- Tipado estático con Pydantic facilita validación de datos.

**Base de datos: MongoDB** *(ver ADR-002)*

**Frontend: React 18** *(ver ADR-003)*

**Contenedores: Docker + Docker Compose**
- Permite despliegue en una máquina limpia con un solo comando (`docker compose up`).
- Estándar de facto en el sector.

**CI/CD: GitHub Actions**
- Integración nativa con el repositorio.
- Sin coste adicional para proyectos académicos.

## Consecuencias

### Positivas
- FastAPI ofrece documentación interactiva en `/docs` sin configuración extra.
- `feedparser` es la librería más madura para RSS en Python.
- Docker Compose simplifica enormemente el despliegue del stack completo.
- GitHub Actions se integra directamente con el repositorio sin configuración externa.

### Negativas
- El equipo debe conocer Python y JavaScript (dos lenguajes).
- MongoDB requiere atención al diseño de esquemas para evitar inconsistencias.
