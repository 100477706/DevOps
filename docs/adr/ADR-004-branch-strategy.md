# ADR-004: Estrategia de Ramas

## Estado

Aceptado

## Fecha

2026-03-11

## Contexto

El equipo trabaja con metodología Scrum en sprints de 2 semanas. Se necesita una estrategia de ramas que:
- Mantenga `main` siempre estable y desplegable.
- Permita el trabajo paralelo de múltiples desarrolladores.
- Se integre con el tablero Kanban de GitHub Issues.
- Facilite la revisión de código mediante Pull Requests.
- Sea sencilla de entender y seguir por todo el equipo.

## Opciones Consideradas

### GitFlow
- Ramas `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`.
- Muy estructurado, ideal para ciclos de release controlados.
- Puede ser complejo para equipos pequeños.

### Trunk-Based Development
- Todo el trabajo se hace en `main` con feature flags.
- Requiere CI/CD muy maduro y despliegues frecuentes.
- Menor aislamiento entre funcionalidades en desarrollo.

### GitFlow Simplificado (opción elegida)
- Ramas: `main`, `develop`, `sprint-X`, `sprint-X/nombre-tarea`.
- Adapta GitFlow a la estructura de sprints de Scrum.
- Elimina las ramas `release/*` y `hotfix/*` para simplificar.

## Decisión

**GitFlow Simplificado** con estructura de ramas adaptada a Scrum:

```
main ← develop ← sprint-X ← sprint-X/nombre-tarea
```

### Protocolo

| Rama | Propósito | Creada por |
|------|-----------|------------|
| `main` | Producción, siempre estable | — |
| `develop` | Integración entre sprints | — |
| `sprint-X` | Rama de integración del sprint | PM |
| `sprint-X/nombre-tarea` | Trabajo individual por tarea | Desarrollador |

### Reglas
1. Nunca hacer commits directamente en `main` o `develop`.
2. `sprint-X` se crea desde `develop` al inicio de cada sprint.
3. Cada tarea del tablero Kanban tiene su propia rama `sprint-X/nombre-tarea`.
4. Toda fusión requiere Pull Request con al menos 1 revisión aprobada.
5. El PR debe pasar todos los checks de CI (tests + calidad de código).

## Consecuencias

### Positivas
- Estructura clara y alineada con los sprints de Scrum.
- `main` y `develop` siempre en estado estable.
- El historial de git es trazable por sprints y tareas.
- Fácil de entender para desarrolladores junior.

### Negativas
- Requiere disciplina para no saltarse el protocolo.
- Merge frecuentes para evitar conflictos en ramas de larga duración.
