# Agente: generate-docs
# Propósito: Generar documentación técnica completa de forma automática

Analiza el proyecto completo y genera los siguientes archivos de documentación.
No modifiques ningún archivo de código fuente — solo genera o actualiza documentación.

## Archivos a generar

### 1. README.md
Actualiza o crea el README.md con:
- Nombre y descripción del proyecto (inferida del código)
- Sección "Sobre este proyecto" con propósito y contexto
- Stack tecnológico con versiones
- Diagrama de arquitectura en formato Mermaid (graph TB)
  - Nodos sin saltos de línea (\n) — usar texto en una sola línea entre comillas
- Descripción de cada capa o módulo principal
- Todos los endpoints REST disponibles (si aplica):
  | Método | URL | Descripción | Parámetros | Respuesta |
- Instrucciones de instalación y ejecución (local y Docker si existe Dockerfile)
- Requisitos previos (versiones de Java, Node, etc.)

### 2. ARCHITECTURE.md
Genera un archivo de arquitectura con:
- Diagrama Mermaid del flujo completo de una request HTTP (sequenceDiagram)
- Diagrama Mermaid de relaciones entre clases principales (classDiagram)
- Diagrama Mermaid de capas del sistema (graph TB)
- Decisiones de diseño relevantes encontradas en el código
- IMPORTANTE: Todos los diagramas Mermaid deben usar sintaxis válida.
  Los nodos NO pueden contener \n — usar texto en una sola línea.

### 3. CHANGELOG.md
Genera o actualiza el CHANGELOG siguiendo el formato Keep a Changelog:
- Sección [Unreleased] con subsecciones Added, Changed, Fixed
- Listar todos los componentes y funcionalidades encontrados en el código

## Reglas importantes
- Nunca modificar archivos .java, .jsx, .js, .ts, .py u otros archivos de código
- Si README.md ya existe, actualizar conservando el contenido previo relevante
- Los diagramas Mermaid deben ser sintácticamente válidos para GitHub
- Inferir toda la información desde el código fuente, no inventar
