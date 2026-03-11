#!/usr/bin/env bash
# =============================================================================
# create-labels.sh – Creates all GitHub labels for the NewsRadar project.
# Usage: bash .github/scripts/create-labels.sh
# Requires: GitHub CLI (gh) authenticated with repo write permissions.
# =============================================================================
set -euo pipefail

REPO="100477706/DevOps"

echo "🏷️  Creating labels for repository: $REPO"
echo ""

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if gh label list --repo "$REPO" | grep -q "^${name}\s"; then
    echo "  ⟳  Updating: $name"
    gh label edit "$name" --repo "$REPO" --color "$color" --description "$description" 2>/dev/null || true
  else
    echo "  ✚  Creating: $name"
    gh label create "$name" --repo "$REPO" --color "$color" --description "$description" 2>/dev/null || true
  fi
}

echo "── Type Labels ──────────────────────────────"
create_label "new"       "0075ca" "Nueva funcionalidad"
create_label "bug"       "d73a4a" "Algo no funciona correctamente"
create_label "docs"      "0052cc" "Mejora o adición de documentación"

echo ""
echo "── Status Labels ────────────────────────────"
create_label "todo"          "e4e669" "Pendiente de empezar"
create_label "in-progress"   "fbca04" "En desarrollo actualmente"
create_label "review-needed" "0e8a16" "Listo para revisión de código"

echo ""
echo "── Sprint Labels ────────────────────────────"
create_label "sprint-1" "bfd4f2" "Sprint 1: Configuración del entorno y arquitectura"
create_label "sprint-2" "a8d8a8" "Sprint 2: DevOps skeleton y API base"
create_label "sprint-3" "f7c6c7" "Sprint 3: Ingesta RSS y motor de alertas"
create_label "sprint-4" "ffd59e" "Sprint 4: Notificaciones y panel de mando"
create_label "sprint-5" "d4b8e0" "Sprint 5: Preparación final y competición"

echo ""
echo "── Priority Labels ──────────────────────────"
create_label "alta"  "e11d48" "Prioridad alta – bloquea otras tareas"
create_label "media" "f97316" "Prioridad media – importante pero no bloqueante"
create_label "baja"  "84cc16" "Prioridad baja – nice-to-have"

echo ""
echo "✅  All labels created/updated successfully."
