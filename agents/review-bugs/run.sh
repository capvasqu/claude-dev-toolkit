#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agente: review-bugs
# Uso: ./agents/review-bugs/run.sh [ruta-al-proyecto]
# Ejemplo: ./agents/review-bugs/run.sh /d/IA/workspace/mi-proyecto
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Revision Integral de Codigo"
echo "============================================================"
echo " Proyecto : $PROJECT_DIR"
echo " Agente   : review-bugs"
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
echo "Iniciando analisis... (esto puede tomar varios minutos)"
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Analisis completado."
echo " Reporte generado: $PROJECT_DIR/REPORTE-REVISION-INTEGRAL.md"
echo "============================================================"
