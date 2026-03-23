#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agente: describe-pr
# Uso: ./agents/describe-pr/run.sh [ruta-al-proyecto]
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Generador de Descripcion de PR"
echo "============================================================"
echo " Proyecto : $PROJECT_DIR"
echo " Agente   : describe-pr"
echo "============================================================"

if [ ! -f "$PROMPT_FILE" ]; then
  echo "ERROR: No se encontro prompt.md en $AGENT_DIR"
  exit 1
fi

if [ ! -d "$PROJECT_DIR" ]; then
  echo "ERROR: El directorio del proyecto no existe: $PROJECT_DIR"
  exit 1
fi

if ! command -v claude &> /dev/null; then
  echo "ERROR: Claude Code no esta instalado."
  echo "Instalar con: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

cd "$PROJECT_DIR"

BRANCH=$(git branch --show-current 2>/dev/null || echo "desconocido")
echo " Branch actual: $BRANCH"
echo ""
echo "Analizando cambios y generando descripcion del PR..."
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Descripcion generada en: $PROJECT_DIR/PR-DESCRIPTION.md"
echo " Copiar el contenido directamente a GitHub al crear el PR."
echo "============================================================"
