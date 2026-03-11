# Architecture Decision Records (ADR) – NewsRadar

Este directorio contiene los **Architecture Decision Records (ADR)** del proyecto NewsRadar. Los ADRs documentan las decisiones de arquitectura importantes tomadas por el equipo, su contexto, alternativas consideradas y la justificación de la elección final.

## ¿Qué es un ADR?

Un ADR es un documento breve que captura una decisión de arquitectura importante junto con su contexto y consecuencias. Seguimos el formato propuesto por Michael Nygard.

## Índice de ADRs

| ADR | Título | Estado | Sprint |
|-----|--------|--------|--------|
| [ADR-001](ADR-001-lenguaje-backend.md) | Elección del lenguaje para el backend | ✅ Aceptado | Sprint 1 |
| [ADR-002](ADR-002-base-de-datos.md) | Elección de la base de datos | ✅ Aceptado | Sprint 1 |
| [ADR-003](ADR-003-framework-frontend.md) | Elección del framework frontend | ✅ Aceptado | Sprint 1 |
| [ADR-004](ADR-004-integracion-ia.md) | Estrategia de integración de IA generativa | 🔄 Propuesto | Sprint 2 |

## Estados posibles
- **Propuesto**: Decisión en discusión, pendiente de aprobación del equipo.
- **Aceptado**: Decisión aprobada y en vigor.
- **Obsoleto**: Decisión que ya no aplica (sustituida por otra).
- **Reemplazado por**: Ver el nuevo ADR indicado.

## Cómo crear un nuevo ADR

1. Copia la plantilla `ADR-000-template.md`.
2. Asígnale el siguiente número correlativo.
3. Nómbralo con el formato `ADR-XXX-descripcion-breve.md`.
4. Rellena todas las secciones de la plantilla.
5. Crea un issue en GitHub con la etiqueta `docs` y `sprint-X`.
6. Abre un PR para que el equipo revise y apruebe el ADR.
