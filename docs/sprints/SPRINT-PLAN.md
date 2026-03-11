# Plan de Sprints – Proyecto NewsRadar

## Resumen del Proyecto

| Aspecto | Detalle |
|---------|---------|
| **Proyecto** | NewsRadar – Sistema de monitorización de noticias RSS |
| **Metodología** | Scrum |
| **Duración de sprint** | 2 semanas |
| **Número de sprints** | 5 |
| **Duración total** | ~10 semanas |

---

## Vista General de Sprints

| Sprint | Fase | Objetivo Principal | Fechas |
|--------|------|--------------------|--------|
| Sprint 1 | Fase 1 | Configuración del entorno, gobernanza y arquitectura | Semanas 1–2 |
| Sprint 2 | Fase 2–3 | Diseño API, esqueleto DevOps, CI/CD y Docker | Semanas 3–4 |
| Sprint 3 | Fase 4a | Ingesta RSS (crawler) y motor de alertas | Semanas 5–6 |
| Sprint 4 | Fase 4b | Notificaciones y panel de mando (Dashboard) | Semanas 7–8 |
| Sprint 5 | Fase 5 | Testing final, refinamiento y preparación para la competición | Semanas 9–10 |

---

## Sprint 1 – Configuración del Entorno y Gobernanza

**Duración:** 2 semanas  
**Rama:** `sprint-1` (creada a partir de `develop`)  
**Objetivo:** Tener el entorno de desarrollo completamente configurado, el flujo de trabajo establecido y las decisiones tecnológicas documentadas.

### Historias de Usuario / Tareas

| ID | Tarea | Tipo | Prioridad | Story Points | Responsable |
|----|-------|------|-----------|--------------|-------------|
| S1-01 | Crear estructura de carpetas del repositorio | `new` | alta | 2 | PM |
| S1-02 | Configurar ramas: main, develop, sprint-1 | `new` | alta | 1 | PM |
| S1-03 | Crear y configurar etiquetas de GitHub | `docs` | alta | 1 | PM |
| S1-04 | Crear plantillas de Issues y PR | `docs` | alta | 2 | PM/SM |
| S1-05 | Redactar ADR-001: Elección del lenguaje backend | `docs` | alta | 2 | Dev Lead |
| S1-06 | Redactar ADR-002: Elección de base de datos | `docs` | alta | 2 | Dev Lead |
| S1-07 | Redactar ADR-003: Elección del framework frontend | `docs` | alta | 2 | Dev Lead |
| S1-08 | Configurar GitHub Actions (CI básico) | `new` | alta | 3 | DevOps |
| S1-09 | Documentar política de ramas y flujo de trabajo | `docs` | media | 2 | SM |
| S1-10 | Invitar al profesor al repositorio | `docs` | alta | 1 | PM |

**Total Story Points Sprint 1:** ~18

### Criterios de Éxito del Sprint
- ✅ Repositorio configurado con estructura de carpetas completa.
- ✅ Flujo de trabajo (ramas, labels, PR templates) operativo.
- ✅ ADRs redactados para las 3 decisiones tecnológicas principales.
- ✅ Pipeline CI básico ejecutándose sin errores.
- ✅ Profesor invitado con acceso de revisión.

---

## Sprint 2 – Diseño de la API y Esqueleto DevOps

**Duración:** 2 semanas  
**Rama:** `sprint-2` (creada a partir de `develop`)  
**Objetivo:** Tener el esqueleto del sistema desplegable con Docker y el diseño completo de la API documentado.

### Historias de Usuario / Tareas

| ID | Tarea | Tipo | Prioridad | Story Points | Responsable |
|----|-------|------|-----------|--------------|-------------|
| S2-01 | Analizar y documentar todos los endpoints de la API | `docs` | alta | 3 | Dev Lead |
| S2-02 | Diseñar modelo de datos (MongoDB/ElasticSearch) | `docs` | alta | 3 | Dev Lead |
| S2-03 | Crear Dockerfile para el backend | `new` | alta | 3 | DevOps |
| S2-04 | Crear Dockerfile para el frontend | `new` | alta | 2 | DevOps |
| S2-05 | Crear docker-compose.yaml (BD + Backend + Frontend) | `new` | alta | 3 | DevOps |
| S2-06 | Configurar pipeline CI/CD completo (GitHub Actions) | `new` | alta | 4 | DevOps |
| S2-07 | Implementar esqueleto del proyecto backend | `new` | alta | 3 | Dev Backend |
| S2-08 | Implementar esqueleto del proyecto frontend | `new` | alta | 3 | Dev Frontend |
| S2-09 | Documentar plan de integración de IA generativa | `docs` | media | 2 | Dev Lead |
| S2-10 | ADR-004: Decisión sobre integración de IA | `docs` | media | 2 | Dev Lead |

**Total Story Points Sprint 2:** ~28

### Criterios de Éxito del Sprint
- ✅ `docker compose up` levanta el sistema completo en una máquina limpia.
- ✅ Todos los endpoints de la API están documentados (OpenAPI/Swagger).
- ✅ Modelo de datos diseñado y documentado.
- ✅ Pipeline CI/CD ejecuta pruebas y construye imágenes Docker.

---

## Sprint 3 – Ingesta RSS y Motor de Alertas

**Duración:** 2 semanas  
**Rama:** `sprint-3` (creada a partir de `develop`)  
**Objetivo:** Implementar el crawler RSS y el motor de alertas con expresiones cron.

### Historias de Usuario / Tareas

| ID | Tarea | Tipo | Prioridad | Story Points | Responsable |
|----|-------|------|-----------|--------------|-------------|
| S3-01 | Implementar crawler RSS (lectura y almacenamiento) | `new` | alta | 5 | Dev Backend |
| S3-02 | Cargar los 100 canales RSS iniciales | `new` | alta | 3 | Dev Backend |
| S3-03 | Implementar clasificación IPTC Media Topics | `new` | alta | 4 | Dev Backend |
| S3-04 | Implementar CRUD de alertas (máx. 20 por gestor) | `new` | alta | 4 | Dev Backend |
| S3-05 | Motor de alertas con expresiones cron | `new` | alta | 5 | Dev Backend |
| S3-06 | Integración de IA para recomendación de sinónimos | `new` | media | 4 | Dev IA |
| S3-07 | Endpoints: GET/POST/PUT/DELETE /alerts | `new` | alta | 3 | Dev Backend |
| S3-08 | Pruebas unitarias del crawler RSS | `new` | alta | 3 | Dev Backend |
| S3-09 | Pruebas unitarias del motor de alertas | `new` | alta | 3 | Dev Backend |

**Total Story Points Sprint 3:** ~34

### Criterios de Éxito del Sprint
- ✅ El crawler lee y almacena artículos de los 100 canales RSS.
- ✅ Las noticias están clasificadas según IPTC Media Topics (primer nivel).
- ✅ Las alertas se activan según las expresiones cron configuradas.
- ✅ Cobertura de pruebas ≥ 70% en los módulos del sprint.

---

## Sprint 4 – Notificaciones y Panel de Mando

**Duración:** 2 semanas  
**Rama:** `sprint-4` (creada a partir de `develop`)  
**Objetivo:** Implementar el sistema de notificaciones y el panel de mando con estadísticas.

### Historias de Usuario / Tareas

| ID | Tarea | Tipo | Prioridad | Story Points | Responsable |
|----|-------|------|-----------|--------------|-------------|
| S4-01 | Sistema de notificaciones por email | `new` | alta | 4 | Dev Backend |
| S4-02 | Buzón interno de notificaciones | `new` | alta | 3 | Dev Backend |
| S4-03 | Formato estándar de título y contenido de alertas | `new` | alta | 2 | Dev Backend |
| S4-04 | Panel de mando – nube de palabras | `new` | alta | 4 | Dev Frontend |
| S4-05 | Panel de mando – estadísticas globales | `new` | alta | 3 | Dev Frontend |
| S4-06 | Panel de mando – gráficos de actividad | `new` | media | 3 | Dev Frontend |
| S4-07 | Interfaz multiidioma ES/EN | `new` | alta | 4 | Dev Frontend |
| S4-08 | Restricción: lectores no pueden gestionar alertas | `new` | alta | 2 | Dev Full |
| S4-09 | Pruebas de integración: notificaciones + alertas | `new` | alta | 3 | Dev Backend |
| S4-10 | Pruebas E2E del panel de mando | `new` | media | 3 | Dev Frontend |

**Total Story Points Sprint 4:** ~31

### Criterios de Éxito del Sprint
- ✅ Las alertas activan notificaciones por email y al buzón interno.
- ✅ El panel de mando muestra nube de palabras y estadísticas.
- ✅ El cambio de idioma ES/EN funciona en toda la interfaz.
- ✅ Los lectores no pueden acceder a la gestión de alertas.

---

## Sprint 5 – Preparación Final y Competición

**Duración:** 2 semanas  
**Rama:** `sprint-5` (creada a partir de `develop`)  
**Objetivo:** Pulir el sistema, realizar simulacros de cambios rápidos y preparar la demo final.

### Historias de Usuario / Tareas

| ID | Tarea | Tipo | Prioridad | Story Points | Responsable |
|----|-------|------|-----------|--------------|-------------|
| S5-01 | Testing completo de la API contra la especificación oficial | `new` | alta | 4 | Dev Backend |
| S5-02 | Simulacros de cambio: añadir/eliminar funcionalidades rápidamente | `new` | alta | 3 | Equipo |
| S5-03 | Optimización del pipeline de despliegue | `new` | media | 3 | DevOps |
| S5-04 | Documentación de usuario final | `docs` | alta | 3 | Dev Lead |
| S5-05 | Revisión y corrección de bugs encontrados | `bug` | alta | 5 | Equipo |
| S5-06 | Verificación final: roles y permisos de usuarios | `new` | alta | 2 | Dev Full |
| S5-07 | Ensayo de la demo (Sprint Review final) | `docs` | alta | 2 | SM + PO |
| S5-08 | Generar documentación técnica automática | `docs` | media | 2 | DevOps |

**Total Story Points Sprint 5:** ~24

### Criterios de Éxito del Sprint
- ✅ Todos los endpoints de la API funcionan correctamente.
- ✅ El sistema se despliega con `docker compose up` en menos de 5 minutos.
- ✅ La demo está lista y el equipo puede hacer cambios rápidamente.
- ✅ Documentación técnica completa y actualizada.

---

## Resumen de Velocidad Planificada

| Sprint | Story Points | Acumulado |
|--------|-------------|-----------|
| Sprint 1 | 18 | 18 |
| Sprint 2 | 28 | 46 |
| Sprint 3 | 34 | 80 |
| Sprint 4 | 31 | 111 |
| Sprint 5 | 24 | 135 |

---

## Gestión del Tablero Kanban

El tablero Kanban se gestiona en **GitHub Projects** con las siguientes columnas:

| Columna | Descripción | Label correspondiente |
|---------|-------------|----------------------|
| 📋 **Backlog** | Issues pendientes de asignar a sprint | - |
| 🎯 **Sprint Actual** | Issues del sprint en curso | `sprint-X` |
| 🔨 **In Progress** | Issues en desarrollo activo | `in-progress` |
| 👀 **In Review** | Issues pendientes de revisión de código | `review-needed` |
| ✅ **Done** | Issues completados y mergeados | - |

### Flujo de un issue en el tablero:
```
Backlog → Sprint Actual → In Progress → In Review → Done
```
