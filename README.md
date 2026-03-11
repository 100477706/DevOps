# NewsRadar – Sistema de Monitorización de Noticias RSS

[![CI Pipeline](https://github.com/100477706/DevOps/actions/workflows/ci.yml/badge.svg)](https://github.com/100477706/DevOps/actions/workflows/ci.yml)

NewsRadar es un sistema de monitorización de noticias RSS con motor de alertas, notificaciones y panel de mando. Desarrollado como proyecto de DevOps siguiendo metodología **Scrum**.

---

## 📋 Tabla de Contenidos

- [Inicio Rápido](#-inicio-rápido)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Flujo de Trabajo](#-flujo-de-trabajo-gitflow)
- [Plan de Sprints](#-plan-de-sprints)
- [Roles del Equipo](#-roles-del-equipo)
- [Gestión de Issues](#-gestión-de-issues)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Stack Tecnológico](#-stack-tecnológico)
- [Documentación](#-documentación)

---

## 🚀 Inicio Rápido

> **Requisito:** Tener instalado Docker y Docker Compose.

```bash
# 1. Clonar el repositorio
git clone https://github.com/100477706/DevOps.git
cd DevOps

# 2. Configurar variables de entorno
cp .env.example .env
# Editar .env con tus valores

# 3. Levantar el sistema completo
docker compose up -d

# 4. Acceder a la aplicación
# Frontend:  http://localhost:3000
# Backend:   http://localhost:8000
# API Docs:  http://localhost:8000/docs
```

---

## 📁 Estructura del Proyecto

```
DevOps/
├── .github/
│   ├── ISSUE_TEMPLATE/        # Plantillas para bugs, features y docs
│   ├── workflows/             # GitHub Actions (CI, CD, sprint management)
│   ├── scripts/               # Scripts de configuración del repositorio
│   ├── labels.yml             # Definición de etiquetas del proyecto
│   └── pull_request_template.md
├── backend/                   # FastAPI – Python 3.11
│   ├── app/
│   │   ├── main.py            # Punto de entrada de la API
│   │   ├── routers/           # Endpoints por dominio
│   │   ├── models/            # Modelos de datos (Beanie/Pydantic)
│   │   └── services/          # Lógica de negocio
│   ├── tests/                 # Pruebas unitarias e integración
│   ├── Dockerfile
│   └── requirements.txt
├── frontend/                  # React 18 + TypeScript + Vite
│   ├── src/
│   ├── Dockerfile
│   └── nginx.conf
├── docker/
│   └── mongo-init.js          # Inicialización de MongoDB
├── docs/
│   ├── adr/                   # Architecture Decision Records
│   ├── sprints/               # Plan de sprints y retrospectivas
│   └── roles/                 # Roles y responsabilidades del equipo
├── docker-compose.yaml        # Orquestación de servicios
├── .env.example               # Plantilla de variables de entorno
└── README.md
```

---

## 🔀 Flujo de Trabajo (GitFlow)

```
main           ← Código en producción (estable)
  └── develop  ← Integración continua de sprints
        └── sprint-1         ← PM crea al inicio del sprint
              ├── sprint-1/new-api-usuarios
              ├── sprint-1/docs-adr-tecnologias
              └── sprint-1/new-docker-setup
```

### Reglas del flujo de trabajo

| Regla | Descripción |
|-------|-------------|
| 🚫 No push directo | Nunca hacer push directo a `main` o `develop` |
| 🌿 Rama por tarea | Cada tarea tiene su rama `sprint-X/nombre-tarea` |
| 👀 Code review | Todo PR requiere al menos 1 aprobación |
| ✅ CI verde | El pipeline de CI debe pasar antes de mergear |
| 📝 PR template | Usar la plantilla estándar para todos los PRs |

### Convención de commits (Conventional Commits)

```
feat(alertas): añadir endpoint POST /alerts
fix(crawler): corregir timeout en fetch RSS
docs(adr): crear ADR-002 sobre base de datos
test(alertas): añadir pruebas unitarias
chore(ci): configurar GitHub Actions
```

---

## 📅 Plan de Sprints

| Sprint | Fase | Objetivo | Duración |
|--------|------|----------|----------|
| **Sprint 1** | Fase 1 | Configuración del entorno y gobernanza | 2 semanas |
| **Sprint 2** | Fase 2-3 | Diseño API, CI/CD y Docker | 2 semanas |
| **Sprint 3** | Fase 4a | Crawler RSS y motor de alertas | 2 semanas |
| **Sprint 4** | Fase 4b | Notificaciones y panel de mando | 2 semanas |
| **Sprint 5** | Fase 5 | Testing final y preparación | 2 semanas |

📄 [Ver plan detallado de sprints](docs/sprints/SPRINT-PLAN.md)

---

## 👥 Roles del Equipo

| Rol | Responsabilidades clave |
|-----|------------------------|
| **Product Owner** | Backlog, prioridades, criterios de aceptación |
| **Scrum Master** | Ceremonias Scrum, eliminación de impedimentos |
| **Project Manager** | Ramas de sprint, tablero Kanban, asignación de tareas |
| **Desarrolladores** | Implementación, pruebas, code review |

📄 [Ver descripción completa de roles](docs/roles/ROLES.md)

---

## 🏷️ Gestión de Issues

El tablero de **GitHub Projects** (Kanban) gestiona todas las tareas mediante issues etiquetados.

### Etiquetas disponibles

| Categoría | Etiquetas |
|-----------|-----------|
| **Tipo** | `new` · `bug` · `docs` |
| **Estado** | `todo` · `in-progress` · `review-needed` |
| **Sprint** | `sprint-1` · `sprint-2` · `sprint-3` · `sprint-4` · `sprint-5` |
| **Prioridad** | `alta` · `media` · `baja` |

### Crear etiquetas (una vez por repositorio)

```bash
# Requiere GitHub CLI autenticado
bash .github/scripts/create-labels.sh
```

---

## 🔄 CI/CD Pipeline

| Workflow | Trigger | Descripción |
|----------|---------|-------------|
| `ci.yml` | Push a `sprint-*`, `develop`, `main` | Tests, linting y validación Docker |
| `cd.yml` | Push a `main` | Build y despliegue en producción |
| `sprint-management.yml` | Manual (PM) | Crear/cerrar ramas de sprint |

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Justificación |
|------|-----------|---------------|
| **Backend** | Python 3.11 + FastAPI | OpenAPI automático, async, ecosistema IA |
| **Base de Datos** | MongoDB 7.0 | Esquema flexible para RSS, búsqueda de texto |
| **Frontend** | React 18 + TypeScript + Vite | Gran ecosistema, visualizaciones, i18n |
| **IA** | OpenAI GPT-4o-mini | Sinónimos, clasificación IPTC, resúmenes |
| **Infraestructura** | Docker + Docker Compose | Despliegue en 1 comando |
| **CI/CD** | GitHub Actions | Integrado en GitHub, gratuito para repos públicos |

---

## 📖 Documentación

| Documento | Descripción |
|-----------|-------------|
| [ADR-001](docs/adr/ADR-001-lenguaje-backend.md) | Elección del lenguaje backend (Python/FastAPI) |
| [ADR-002](docs/adr/ADR-002-base-de-datos.md) | Elección de base de datos (MongoDB) |
| [ADR-003](docs/adr/ADR-003-framework-frontend.md) | Elección del framework frontend (React) |
| [ADR-004](docs/adr/ADR-004-integracion-ia.md) | Estrategia de integración de IA generativa |
| [Plan de Sprints](docs/sprints/SPRINT-PLAN.md) | Desglose de tareas por sprint |
| [Roles](docs/roles/ROLES.md) | Roles, responsabilidades y flujo de trabajo |

---

## 🧪 Ejecutar pruebas localmente

```bash
# Backend
cd backend
pip install -r requirements.txt -r requirements-dev.txt
pytest --cov=app --cov-report=term-missing

# Frontend (cuando esté implementado)
cd frontend
npm ci
npm test
```

---

## 📝 Licencia

Este proyecto es desarrollado con fines académicos para la asignatura de DevOps.
