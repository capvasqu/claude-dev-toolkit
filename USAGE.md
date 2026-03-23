# Guia de uso — Claude Dev Toolkit

Guia detallada para equipos que quieran adoptar el toolkit
en su flujo de trabajo de desarrollo.

---

## Caso de uso 1: Code review automatico en PRs

### Situacion
El equipo pierde tiempo en code reviews manuales revisando
siempre los mismos tipos de problemas: validaciones faltantes,
malas practicas, problemas de seguridad basicos.

### Solucion
Configurar el workflow `review-bugs.yml` para que Claude Code
haga una primera pasada automatica en cada PR, dejando un
comentario con los hallazgos. El reviewer humano se enfoca
en lo que la maquina no puede ver: logica de negocio, arquitectura
y decision de diseno.

### Configuracion (5 minutos)
1. Copiar `.github/workflows/review-bugs.yml` a tu repositorio
2. Copiar `.github/prompts/review-bugs.md` a tu repositorio
3. Agregar `ANTHROPIC_API_KEY` en Settings → Secrets → Actions
4. El workflow se activa automaticamente en el proximo PR

### Resultado esperado
Cada PR recibe un comentario automatico con:
- Tabla de hallazgos por categoria (bugs, calidad, seguridad, performance)
- Detalle de cada hallazgo con archivo, linea y correccion sugerida
- Plan de accion priorizado

---

## Caso de uso 2: Documentacion siempre actualizada

### Situacion
La documentacion del proyecto esta desactualizada o directamente
no existe. Nadie tiene tiempo de escribirla y mantenerla.

### Solucion
Ejecutar el agente `generate-docs` al inicio del proyecto y
cada vez que se hagan cambios de arquitectura importantes.

### Ejecucion
```bash
./agents/generate-docs/run.sh /ruta/a/tu/proyecto
```

### Resultado esperado
- README.md completo con diagrama de arquitectura Mermaid
- ARCHITECTURE.md con flujos y relaciones entre clases
- CHANGELOG.md con historial de cambios

---

## Caso de uso 3: PRs con descripciones profesionales

### Situacion
Los desarrolladores abren PRs con descripciones vacias o
muy breves: "fix bug", "new feature". Esto dificulta el
code review y la trazabilidad.

### Solucion
El workflow `describe-pr.yml` genera automaticamente la
descripcion del PR al momento de abrirlo, basandose en
el diff real de los cambios.

### Configuracion
1. Copiar `.github/workflows/describe-pr.yml` a tu repositorio
2. Copiar `.github/prompts/describe-pr.md` a tu repositorio
3. El workflow se activa automaticamente al abrir un PR nuevo

### Resultado esperado
Cada PR nuevo recibe automaticamente una descripcion con:
- Resumen de los cambios
- Tipo de cambio (bug fix, feature, refactoring)
- Tabla de archivos modificados
- Checklist para el desarrollador y el reviewer

---

## Caso de uso 4: Visibilidad de deuda tecnica

### Situacion
El equipo sabe que hay deuda tecnica pero no tiene un inventario
claro de cuanta hay ni como priorizarla.

### Solucion
El workflow `tech-debt.yml` ejecuta un analisis semanal automatico
y crea un Issue en GitHub con el reporte completo.

### Configuracion
1. Copiar `.github/workflows/tech-debt.yml` a tu repositorio
2. El workflow se ejecuta automaticamente cada lunes
3. Para ejecucion manual: Actions → Analisis de Deuda Tecnica → Run workflow

### Resultado esperado
Issue semanal con:
- Inventario completo de deuda tecnica por categoria
- Estimacion de esfuerzo para cada item
- Roadmap de remediacion priorizado (quick wins, medio plazo, backlog)

---

## Personalizar prompts para tu equipo

El valor real del toolkit esta en adaptar los prompts a las
convenciones especificas de tu equipo. Ejemplo para un equipo bancario:

### Agregar reglas de seguridad bancaria en review-bugs/prompt.md

```markdown
### Reglas adicionales de seguridad (contexto bancario)
- Verificar que datos sensibles (RUT, cuenta, tarjeta) nunca
  aparezcan en logs ni en respuestas de error
- Confirmar que todos los endpoints financieros tienen autenticacion
- Revisar que las transacciones monetarias usan BigDecimal
  con escala correcta (nunca double o float)
- Verificar cifrado de datos en reposo para informacion sensible
```

---

## Preguntas frecuentes

### ¿Cuanto cuesta ejecutar los agentes?
Depende del tamano del repositorio y el modelo usado.
Un repositorio de tamano medio (50-100 archivos) consume
aproximadamente $0.10-0.50 USD por ejecucion con Claude Sonnet.

### ¿Los agentes modifican el codigo de produccion?
Los agentes `review-bugs`, `tech-debt` y `describe-pr` solo generan
reportes — no modifican codigo. El agente `generate-tests` crea
archivos de test nuevos pero nunca modifica codigo existente.
El agente `generate-docs` solo crea o actualiza archivos .md.

### ¿Funciona con cualquier lenguaje?
Si. Los prompts incluyen instrucciones para Java/Spring Boot y
React/JavaScript. Puedes editarlos para agregar Python, .NET,
Go u otros lenguajes que use tu equipo.

### ¿Como actualizar los prompts en produccion?
Editar directamente el archivo `.github/prompts/nombre-agente.md`
en tu repositorio. El cambio se aplica en la proxima ejecucion
del workflow sin necesidad de modificar el YAML.
