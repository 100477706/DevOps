# Roles y Responsabilidades – Proyecto NewsRadar

## Equipo Scrum

El proyecto NewsRadar sigue la metodología **Scrum** con los siguientes roles y responsabilidades:

---

## 🎯 Product Owner (PO)

**Responsabilidades:**
- Mantener y priorizar el **Product Backlog**.
- Definir y comunicar la visión del producto al equipo.
- Escribir y refinar las **Historias de Usuario** (User Stories) con criterios de aceptación claros.
- Aceptar o rechazar el trabajo completado en cada Sprint Review.
- Coordinar con el profesor/cliente para validar los requisitos de la API.

**Herramientas principales:**
- GitHub Issues (creación y priorización)
- GitHub Projects (tablero Kanban)

---

## 🔄 Scrum Master (SM)

**Responsabilidades:**
- Facilitar todas las ceremonias Scrum: Sprint Planning, Daily Standup, Sprint Review, Sprint Retrospective.
- Eliminar impedimentos que bloqueen al equipo de desarrollo.
- Asegurar que el equipo sigue los principios y prácticas Scrum.
- Documentar las retrospectivas y las acciones de mejora.
- Velar por el cumplimiento del flujo de trabajo de ramas definido.

**Herramientas principales:**
- GitHub Issues (gestión del tablero)
- Documentación en `docs/sprints/retrospectivas/`

---

## 📋 Project Manager (PM)

**Responsabilidades:**
- Crear la **rama `sprint-X`** al inicio de cada sprint, a partir de `develop`.
- Gestionar el tablero Kanban de GitHub (mover issues entre columnas).
- Asignar issues a los desarrolladores al inicio del sprint.
- Asegurar que los PRs siguen el flujo correcto (rama tarea → sprint-X → develop → main).
- Monitorizar el progreso del sprint y comunicar desvíos al Scrum Master.
- Ejecutar el workflow `sprint-management.yml` para crear ramas de sprint.

**Herramientas principales:**
- GitHub Actions (workflow `sprint-management.yml`)
- GitHub Projects (tablero Kanban)

---

## 💻 Desarrolladores

**Responsabilidades:**
- Crear ramas de tarea (`sprint-X/nombre-tarea`) a partir de la rama `sprint-X`.
- Implementar las funcionalidades asignadas cumpliendo los criterios de aceptación.
- Escribir pruebas unitarias e integración para el código desarrollado.
- Crear Pull Requests usando la plantilla estándar del proyecto.
- Revisar el código de compañeros cuando se requiera revisión (`review-needed`).
- Actualizar el estado del issue correspondiente en el tablero Kanban.
- Participar en las ceremonias Scrum.

**Convención de nombrado de ramas:**
```
sprint-{N}/{tipo}-{descripcion-breve}
# Ejemplos:
sprint-1/docs-adr-base-de-datos
sprint-2/new-api-alertas
sprint-3/new-crawler-rss
sprint-4/bug-fix-notificaciones
```

---

## ⏱️ Ceremonias Scrum y Tiempos

| Ceremonia | Frecuencia | Duración máx. | Responsable |
|-----------|-----------|---------------|-------------|
| **Sprint Planning** | Inicio de cada sprint | 2 horas | Scrum Master |
| **Daily Standup** | Cada día hábil | 15 minutos | Scrum Master |
| **Sprint Review** | Fin de cada sprint | 1 hora | Product Owner |
| **Sprint Retrospectiva** | Fin de cada sprint | 45 minutos | Scrum Master |
| **Refinement del Backlog** | A mitad del sprint | 1 hora | Product Owner + Equipo |

### Estructura del Daily Standup (15 min)
Cada miembro responde brevemente:
1. ¿Qué hice ayer?
2. ¿Qué voy a hacer hoy?
3. ¿Tengo algún impedimento?

---

## 📊 Definition of Done (DoD)

Una tarea se considera **terminada** cuando:

- [ ] El código está implementado y funciona según los criterios de aceptación.
- [ ] Se han escrito pruebas unitarias (cobertura mínima del 70%).
- [ ] El pipeline de CI pasa sin errores (`ci.yml`).
- [ ] El código ha sido revisado y aprobado por al menos **1 compañero**.
- [ ] El PR ha sido mergeado en la rama `sprint-X`.
- [ ] La documentación relevante ha sido actualizada.
- [ ] El issue correspondiente está cerrado y el tablero actualizado.

---

## 🔀 Flujo de Trabajo de Ramas

```
main
 └── develop
      └── sprint-1          ← PM crea al inicio del sprint
           ├── sprint-1/new-api-usuarios
           ├── sprint-1/docs-adr-tecnologias
           └── sprint-1/new-docker-setup
```

### Reglas importantes:
1. **Nunca** hacer push directo a `main` o `develop`.
2. Los PR de tareas individuales van a `sprint-X`, **no** a `develop`.
3. Al cerrar el sprint, el PM abre un PR de `sprint-X` → `develop`.
4. Solo se mergea a `main` después de una Sprint Review exitosa.
5. Los commits deben seguir el formato: `tipo(scope): descripción breve`.

### Formato de commits (Conventional Commits):
```
feat(alertas): añadir endpoint POST /alerts
fix(crawler): corregir timeout en fetch RSS
docs(adr): crear ADR-002 sobre elección de framework
test(alertas): añadir pruebas unitarias para AlertService
chore(ci): configurar GitHub Actions para CI
```
