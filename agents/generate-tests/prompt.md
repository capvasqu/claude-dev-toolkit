# Agente: generate-tests
# Propósito: Generar tests unitarios para clases sin cobertura

Analiza el proyecto y genera tests unitarios para las clases que no tienen
cobertura de tests o que tienen casos TODO pendientes.

## Instrucciones

### 1. Identificar clases sin tests
Busca en el código fuente:
- Clases de servicio (@Service) sin archivo de test correspondiente
- Archivos de test existentes con métodos marcados como TODO
- Métodos públicos en servicios que no tienen ningún test

### 2. Generar los tests
Para cada clase identificada, genera tests siguiendo estas reglas:

#### Para proyectos Java/Spring Boot:
- Framework: JUnit 5 + Mockito + AssertJ
- Anotación de clase: @ExtendWith(MockitoExtension.class)
- @DisplayName en español describiendo el comportamiento esperado
- Nombre del método: metodo_contexto_resultadoEsperado
- Un test por comportamiento concreto
- @BeforeEach con datos de prueba reutilizables
- Mockear solo repositorios y dependencias externas
- Usar assertThat de AssertJ, nunca assertEquals de JUnit
- Incluir casos: happy path, caso null/vacío, caso no encontrado, caso borde

#### Para proyectos JavaScript/React:
- Framework: Jest + React Testing Library
- Describir el componente con describe()
- Un it() por comportamiento
- Mockear llamadas a la API con jest.mock()

### 3. Casos de test mínimos por método de servicio
Para cada método público generar al menos:
- Test del caso exitoso (happy path)
- Test cuando el recurso no existe (debe lanzar excepción)
- Test con parámetro null o inválido
- Test del caso borde más relevante

### 4. Dónde guardar los tests
- Java: src/test/java/[mismo paquete que la clase]
- JavaScript: src/__tests__/ o junto al componente como ComponentName.test.js

### 5. No modificar
- Nunca modificar clases de producción
- Nunca modificar tests existentes que ya pasen
- Solo agregar tests nuevos o completar los marcados como TODO
