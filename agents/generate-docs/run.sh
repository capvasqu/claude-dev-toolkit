#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agente: generate-docs
# Uso: ./agents/generate-docs/run.sh [ruta-al-proyecto]
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Generador de Documentacion Tecnica"
echo "============================================================"
echo " Proyecto : $PROJECT_DIR"
echo " Agente   : generate-docs"
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

echo ""
echo "Generando documentacion... (esto puede tomar varios minutos)"
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Documentacion generada:"
echo "   - README.md"
echo "   - ARCHITECTURE.md"
echo "   - CHANGELOG.md"
echo "============================================================"
