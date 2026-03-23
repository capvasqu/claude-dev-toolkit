# Agente: tech-debt
# Propósito: Detectar y priorizar deuda técnica por impacto

Analiza el proyecto completo e identifica toda la deuda técnica existente.
Genera un archivo REPORTE-DEUDA-TECNICA.md con los hallazgos priorizados.

## Qué es deuda técnica
Código que funciona pero que fue hecho de forma subóptima y que eventualmente
tendrá un costo mayor si no se corrige: difícil de mantener, escalar o entender.

## Categorías a analizar

### 1. Deuda de arquitectura
- Violaciones al patrón de capas (lógica de negocio en el controller)
- Dependencias circulares entre módulos
- Clases con demasiadas responsabilidades (God Classes)
- Acoplamiento excesivo entre componentes

### 2. Deuda de código
- Código duplicado (misma lógica en múltiples lugares)
- Métodos con más de 30 líneas o más de 4 parámetros
- Comentarios TODO/FIXME/HACK sin seguimiento
- Variables con nombres genéricos (data, temp, obj, x)
- Lógica compleja sin comentarios explicativos
- Magic numbers o strings literales sin constantes

### 3. Deuda de tests
- Clases sin tests o con cobertura menor al 50%
- Tests que prueban implementación en lugar de comportamiento
- Tests sin @DisplayName o con nombres poco descriptivos
- Ausencia de tests de integración o edge cases

### 4. Deuda de dependencias
- Dependencias desactualizadas (comparar con versiones recientes)
- Dependencias no utilizadas en el proyecto
- Dependencias con vulnerabilidades conocidas

### 5. Deuda de configuración
- Configuraciones hardcodeadas que deberían ser variables de entorno
- Falta de perfiles de configuración (dev, test, prod)
- Secrets o passwords en archivos de configuración

## Formato del reporte

# Reporte de Deuda Técnica
**Proyecto:** [nombre]
**Fecha:** [fecha actual]
**Deuda total estimada:** [X horas/días de trabajo]

## Resumen ejecutivo
[2-3 párrafos con el estado general de la deuda técnica]

## Índice de deuda por categoría
| Categoría | Items | Esfuerzo estimado | Prioridad |
|-----------|-------|-------------------|-----------|
| Arquitectura | | | |
| Código | | | |
| Tests | | | |
| Dependencias | | | |
| Configuración | | | |

## Hallazgos detallados

### [Categoría]

#### DT-001: [título del hallazgo]
- **Severidad:** Alta / Media / Baja
- **Ubicación:** archivo(s) afectado(s)
- **Descripción:** qué está mal y por qué es deuda
- **Impacto si no se corrige:** consecuencia a futuro
- **Esfuerzo de corrección:** X horas
- **Sugerencia:** cómo resolverlo

## Roadmap de remediación recomendado

### Sprint 1 (Quick wins — menos de 4h cada uno)
[Lista de items de bajo esfuerzo y alto impacto]

### Sprint 2 (Medio plazo — 1 a 3 días cada uno)
[Lista de items de esfuerzo medio]

### Backlog (Largo plazo — planificar en roadmap)
[Items de alto esfuerzo que requieren planificación]
