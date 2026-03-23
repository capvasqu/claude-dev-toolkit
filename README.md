# Claude Dev Toolkit

Coleccion de agentes Claude Code para automatizar tareas repetitivas
en equipos de desarrollo de software.

Cada agente puede ejecutarse manualmente desde la terminal o integrarse
a GitHub Actions para ejecucion automatica en el ciclo de CI/CD.

---

## Agentes disponibles

| Agente | Proposito | Ejecucion manual | GitHub Actions |
|--------|-----------|-----------------|----------------|
| `review-bugs` | Revision integral: bugs, calidad, seguridad y performance | Si | En cada PR |
| `generate-docs` | Genera README, ARCHITECTURE.md y CHANGELOG automaticamente | Si | Manual |
| `generate-tests` | Genera tests unitarios para clases sin cobertura | Si | Manual |
| `describe-pr` | Genera descripcion profesional del Pull Request | Si | Al abrir PR |
| `tech-debt` | Detecta y prioriza deuda tecnica del proyecto | Si | Semanal (lunes) |

---

## Requisitos

- [Claude Code](https://docs.anthropic.com/claude-code) instalado globalmente
- Node.js 18 o superior
- Git Bash (Windows) o terminal Unix/Mac
- Cuenta en [Anthropic Console](https://console.anthropic.com) con API key

### Instalacion de Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

---

## Uso manual

### Desde el directorio del toolkit

```bash
# Clonar el toolkit
git clone https://github.com/capvasqu/claude-dev-toolkit.git
cd claude-dev-toolkit

# Dar permisos de ejecucion a los scripts (Unix/Mac/Git Bash)
chmod +x agents/*/run.sh

# Ejecutar un agente sobre tu proyecto
./agents/review-bugs/run.sh /ruta/a/tu/proyecto
./agents/generate-docs/run.sh /ruta/a/tu/proyecto
./agents/generate-tests/run.sh /ruta/a/tu/proyecto
./agents/describe-pr/run.sh /ruta/a/tu/proyecto
./agents/tech-debt/run.sh /ruta/a/tu/proyecto
```

### Desde el directorio de tu proyecto

```bash
cd /ruta/a/tu/proyecto

# Ejecutar directamente con Claude Code
claude --print "$(cat /ruta/al/toolkit/agents/review-bugs/prompt.md)"
```

---

## Integracion con GitHub Actions

## Prerequisitos

- [Claude Code](https://docs.anthropic.com/claude-code) instalado globalmente
- Node.js 18 o superior
- Git Bash (Windows) o terminal Unix/Mac
- Cuenta en [claude.ai](https://claude.ai) con suscripcion Pro o Max
- `CLAUDE_CODE_OAUTH_TOKEN` generado con `claude setup-token`

### Prerequisito: configurar el secreto CLAUDE_CODE_OAUTH_TOKEN

1. En tu repositorio ir a **Settings → Secrets and variables → Actions**
2. Crear un nuevo secreto llamado `CLAUDE_CODE_OAUTH_TOKEN`
3. Generar el token ejecutando `claude setup-token` en Git Bash
4. Pegar el token generado como valor del secreto

### Copiar los workflows a tu repositorio

```bash
# Desde la raiz de tu proyecto
cp -r /ruta/al/toolkit/.github .
```

O copiar manualmente los archivos de `.github/workflows/` y `.github/prompts/`
a tu repositorio.

### Comportamiento de cada workflow

#### review-bugs.yml
- **Disparador:** cada vez que se abre o actualiza un Pull Request
- **Accion:** analiza el codigo y publica el reporte como comentario en el PR
- **Artefacto:** guarda el reporte completo por 30 dias

#### describe-pr.yml
- **Disparador:** cuando se abre un Pull Request nuevo
- **Accion:** genera y actualiza automaticamente la descripcion del PR

#### tech-debt.yml
- **Disparador:** todos los lunes a las 8am UTC (automatico) o manual
- **Accion:** analiza la deuda tecnica y crea un Issue con el reporte
- **Artefacto:** guarda el reporte completo por 90 dias

---

## Personalizar los prompts

Cada agente tiene un archivo `prompt.md` que puedes editar para adaptarlo
a las convenciones de tu equipo:

```
agents/
  review-bugs/prompt.md    ← agregar reglas de seguridad de tu empresa
  generate-docs/prompt.md  ← ajustar estructura de documentacion
  generate-tests/prompt.md ← especificar frameworks de tu proyecto
  describe-pr/prompt.md    ← personalizar template del PR
  tech-debt/prompt.md      ← ajustar criterios de prioridad
```

---

## Integracion con herramientas de analisis estatico

Claude Code realiza el analisis semantico del codigo. Para analisis
estatico continuo se recomienda complementar con:

| Herramienta | Proposito | Integracion |
|-------------|-----------|-------------|
| SonarQube / SonarCloud | Calidad y cobertura de codigo | GitHub Action disponible |
| OWASP Dependency-Check | Vulnerabilidades en dependencias | Plugin Maven/Gradle |
| Snyk | Seguridad en dependencias y contenedores | GitHub Action disponible |
| Checkstyle | Estilo de codigo Java | Plugin Maven |

---

## Estructura del proyecto

```
claude-dev-toolkit/
├── agents/
│   ├── review-bugs/
│   │   ├── prompt.md     # Instruccion completa al agente
│   │   └── run.sh        # Script de ejecucion manual
│   ├── generate-docs/
│   ├── generate-tests/
│   ├── describe-pr/
│   └── tech-debt/
├── .github/
│   ├── workflows/
│   │   ├── review-bugs.yml    # CI: ejecuta en cada PR
│   │   ├── describe-pr.yml    # CI: genera descripcion al abrir PR
│   │   └── tech-debt.yml      # Scheduled: analisis semanal
│   └── prompts/               # Prompts para los workflows
└── README.md
```

---

## Autor

**Carlos Alberto Polo Vasquez**
IT Community Lead | Tech Lead | AI Automation
[github.com/capvasqu](https://github.com/capvasqu)

---

## Licencia

MIT — libre para usar, modificar y distribuir.
