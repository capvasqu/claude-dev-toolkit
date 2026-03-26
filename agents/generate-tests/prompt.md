# Agent: generate-tests
# Purpose: Generate unit tests for classes without coverage

Analyze the project and generate unit tests for classes that have no test
coverage or that have pending TODO cases.

## Instructions

### 1. Identify classes without tests
Search the source code for:
- Service classes (@Service) without a corresponding test file
- Existing test files with methods marked as TODO
- Public methods in services that have no tests at all

### 2. Generate the tests
For each identified class, generate tests following these rules:

#### For Java/Spring Boot projects:
- Framework: JUnit 5 + Mockito + AssertJ
- Class annotation: @ExtendWith(MockitoExtension.class)
- @DisplayName in English describing the expected behavior
- Method name: method_context_expectedResult
- One test per concrete behavior
- @BeforeEach with reusable test data
- Mock only repositories and external dependencies
- Use assertThat from AssertJ, never assertEquals from JUnit
- Include cases: happy path, null/empty case, not found case, edge case

#### For JavaScript/React projects:
- Framework: Jest + React Testing Library
- Describe the component with describe()
- One it() per behavior
- Mock API calls with jest.mock()

### 3. Minimum test cases per service method
For each public method generate at least:
- Happy path test
- Test when resource does not exist (should throw exception)
- Test with null or invalid parameter
- Test for the most relevant edge case

### 4. Where to save the tests
- Java: src/test/java/[same package as the class]
- JavaScript: src/__tests__/ or next to the component as ComponentName.test.js

### 5. Do not modify
- Never modify production classes
- Never modify existing passing tests
- Only add new tests or complete those marked as TODO
