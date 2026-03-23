# Agente: describe-pr
# Propósito: Generar descripción profesional de un Pull Request desde el git diff

Analiza los cambios del branch actual comparado con main/master y genera
una descripción completa y profesional para el Pull Request.

## Instrucciones

### 1. Obtener los cambios
Ejecuta estos comandos para entender el contexto:
```
git log main..HEAD --oneline
git diff main..HEAD --stat
git diff main..HEAD
```

### 2. Analizar los cambios
Identifica:
- Qué archivos fueron modificados y por qué
- Qué funcionalidades fueron agregadas, modificadas o eliminadas
- Si hay cambios en tests, documentación o configuración
- El impacto de los cambios (breaking changes, nuevas dependencias)

### 3. Generar el archivo PR-DESCRIPTION.md
Genera un archivo PR-DESCRIPTION.md en la raíz con esta estructura exacta:

## Descripción
[Resumen en 2-3 líneas de qué hace este PR y por qué]

## Tipo de cambio
- [ ] Bug fix
- [ ] Nueva funcionalidad
- [ ] Refactoring
- [ ] Documentación
- [ ] Tests
- [ ] Configuración / DevOps

Marcar con [x] los que apliquen según los cambios detectados.

## Cambios realizados
- [lista de cambios concretos encontrados en el diff]

## Archivos modificados
| Archivo | Tipo de cambio | Descripción |
|---------|---------------|-------------|
[tabla con cada archivo modificado]

## Testing
- [ ] Tests unitarios agregados/actualizados
- [ ] Tests de integración verificados
- [ ] Probado manualmente en entorno local

## Checklist
- [ ] El código sigue las convenciones del proyecto
- [ ] Se agregó documentación para cambios públicos
- [ ] No hay secretos ni datos sensibles expuestos
- [ ] Los tests existentes siguen pasando

## Notas para el reviewer
[Puntos específicos donde el reviewer debería prestar especial atención]

### 4. Mostrar en consola
Al finalizar, muestra en consola el contenido del PR-DESCRIPTION.md
para que el desarrollador pueda copiarlo directamente a GitHub.
