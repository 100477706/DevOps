# NewsRadar — DevOps Project

> Sistema de monitorización de noticias basado en RSS con alertas configurables, clasificación IPTC y panel de control en tiempo real.

---

## 📋 Descripción del Proyecto

NewsRadar es un sistema de monitorización de noticias que permite:
- **Ingesta de RSS**: Crawler que lee hasta 100 canales RSS y almacena las noticias.
- **Motor de Alertas**: Expresiones cron para monitorizar descriptores y clasificar noticias (máx. 20 alertas por gestor).
- **Notificaciones**: Envío de correos electrónicos y mensajes al buzón interno.
- **Panel de Mando**: Interfaz con nube de palabras y estadísticas globales.
- **Clasificación IPTC**: Categorización de noticias según IPTC Media Topics.
- **Multilenguaje**: Soporte para ES/EN en la interfaz.

---

## 🗂️ Estructura del Repositorio

```
DevOps/
├── .github/
│   ├── workflows/          # GitHub Actions CI/CD pipelines
│   └── ISSUE_TEMPLATE/     # Plantillas de Issues
├── docs/
│   └── adr/                # Architecture Decision Records
├── backend/                # API REST (Python / FastAPI)
│   ├── app/
│   │   ├── api/            # Endpoints de la API
│   │   ├── models/         # Modelos de datos
│   │   ├── services/       # Lógica de negocio
│   │   └── utils/          # Utilidades
│   ├── tests/              # Pruebas unitarias y funcionales
│   ├── Dockerfile
│   └── requirements.txt
├── frontend/               # Interfaz de usuario (React)
│   ├── src/
│   ├── Dockerfile
│   └── package.json
├── docker-compose.yml      # Orquestación de servicios
└── .env.example            # Variables de entorno de ejemplo
```

---

## 🚀 Inicio Rápido

### Prerrequisitos
- [Docker](https://www.docker.com/) >= 20.x
- [Docker Compose](https://docs.docker.com/compose/) >= 2.x

### Levantar el Sistema Completo

```bash
# Copiar y configurar variables de entorno
cp .env.example .env

# Levantar todos los servicios (DB + Backend + Frontend)
docker compose up --build
```

Los servicios estarán disponibles en:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Docs (Swagger)**: http://localhost:8000/docs
- **MongoDB**: mongodb://localhost:27017

### Ejecutar Tests

```bash
# Tests del backend
cd backend && pip install -r requirements.txt && pytest

# Tests del frontend
cd frontend && npm install && npm test
```

---

## 🔀 Protocolo de Ramas (GitFlow)

| Rama | Descripción |
|------|-------------|
| `main` | Código en producción. Siempre estable. |
| `develop` | Integración de funcionalidades terminadas por sprint. |
| `sprint-X` | Creada al inicio de cada sprint a partir de `develop`. |
| `sprint-X/nombre-tarea` | Rama individual de cada desarrollador. |

### Flujo de Trabajo

```
main ←── develop ←── sprint-1 ←── sprint-1/mi-tarea
```

1. El PM crea `sprint-X` desde `develop` al inicio de cada sprint.
2. Cada desarrollador crea `sprint-X/nombre-tarea` desde `sprint-X`.
3. Al terminar, se abre un PR hacia `sprint-X` con revisión obligatoria.
4. Al final del sprint, `sprint-X` se fusiona en `develop`.
5. En producción, `develop` se fusiona en `main`.

---

## 🏷️ Gestión de Issues (GitHub Kanban)

### Etiquetas

| Categoría | Etiquetas |
|-----------|-----------|
| **Tipo** | `new`, `bug`, `docs` |
| **Estado** | `todo`, `in-progress`, `review-needed` |
| **Sprint** | `sprint-1`, `sprint-2`, ... |
| **Prioridad** | `alta`, `media`, `baja` |

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología |
|------|-----------|
| Backend | Python 3.11 + FastAPI |
| Base de Datos | MongoDB |
| Frontend | React 18 |
| Contenedores | Docker + Docker Compose |
| CI/CD | GitHub Actions |
| Calidad de Código | Ruff (Python) + ESLint (JS) |

> Ver las [Architecture Decision Records](docs/adr/README.md) para más detalle.

---

## 📄 Decisiones de Arquitectura (ADR)

- [ADR-001: Selección del Stack Tecnológico](docs/adr/ADR-001-technology-stack.md)
- [ADR-002: Selección de Base de Datos](docs/adr/ADR-002-database.md)
- [ADR-003: Framework de Frontend](docs/adr/ADR-003-frontend-framework.md)
- [ADR-004: Estrategia de Ramas](docs/adr/ADR-004-branch-strategy.md)

---

## 🤝 Contribución

1. Consulta el [tablero Kanban](../../projects) para tareas disponibles.
2. Crea tu rama `sprint-X/nombre-tarea` desde la rama de sprint activa.
3. Abre un PR siguiendo la [plantilla](.github/pull_request_template.md).
4. El PR debe pasar todos los checks de CI antes del merge.
