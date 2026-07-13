# Demo Karate Framework - QA Automation Workshop

Proyecto demostrativo profesional para taller de capacitacion sobre diseno QA (Test Scenarios/Test Cases) y automatizacion de pruebas API con Karate Framework.

## 1. Objetivo
Mostrar de forma trazable como pasar de un requerimiento funcional a pruebas automatizadas mantenibles:

`Requerimiento -> Test Scenario -> Test Case -> Feature Karate -> Ejecucion -> Reporte`

## 2. Stack tecnologico
- Java 17
- Maven
- Karate Framework + JUnit 5
- IntelliJ IDEA
- GitHub Actions (pipeline basico)

## 3. Arquitectura de pruebas
Se aplica una arquitectura orientada a mantenibilidad:

- `docs/`: diseno QA (estrategia, escenarios, casos, riesgos, antipatrones)
- `src/test/java/config`: configuraciones y parametrizacion de entorno
- `src/test/java/utils`: utilidades reutilizables (datos dinamicos)
- `src/test/java/runners`: punto de entrada de ejecucion
- `src/test/resources/features/users`: 1 feature por comportamiento CRUD
- `src/test/resources/payloads/users`: payloads versionados y reutilizables
- `src/test/resources/data`: datasets y contratos (schemas)
- `presentation-demo/`: guion visual del taller

## 4. Estructura del proyecto
```text
demo-karate/
|-- docs/
|   |-- anti-patterns.md
|   |-- risk-analysis.md
|   |-- test-cases.md
|   |-- test-scenarios.md
|   `-- test-strategy.md
|-- presentation-demo/
|   |-- 01-requirement.md
|   |-- 02-test-scenario.md
|   |-- 03-test-case.md
|   |-- 04-feature-karate.md
|   |-- 05-execution.md
|   |-- 06-report.md
|   `-- README.md
|-- src/
|   `-- test/
|       |-- java/
|       |   |-- config/TestConfig.java
|       |   |-- runners/UsersApiRunner.java
|       |   `-- utils/DataGenerators.java
|       `-- resources/
|           |-- karate-config.js
|           |-- data/
|           |   |-- schemas/
|           |   |   |-- create-user-response-schema.json
|           |   |   |-- get-user-response-schema.json
|           |   |   `-- update-user-response-schema.json
|           |   `-- users/
|           |       |-- get-user-negative.json
|           |       |-- get-user-positive.json
|           |       `-- update-delete-targets.json
|           |-- features/
|           |   `-- users/
|           |       |-- create-user.feature
|           |       |-- delete-user.feature
|           |       |-- get-user.feature
|           |       `-- update-user.feature
|           `-- payloads/
|               `-- users/
|                   |-- create-user-base.json
|                   `-- update-user-base.json
|-- .github/workflows/ci.yml
|-- pom.xml
`-- README.md
```

## 5. Principios de Quality Engineering aplicados
- **DRY**: payloads y schemas reutilizables.
- **KISS**: features cortas por comportamiento.
- **Single Responsibility**: cada feature valida una capacidad de negocio.
- **Naming Convention**: nombres expresivos de escenarios.
- **Risk-Based Testing**: cobertura priorizada por impacto.

## 6. Buenas practicas demostradas
- Validacion completa: status + body + headers + contrato + tiempo.
- Data-driven testing con `Scenario Outline` y archivos JSON.
- Independencia entre pruebas (sin dependencia de orden).
- Configuracion centralizada (`karate-config.js`, `TestConfig.java`).
- Datos dinamicos para reducir colisiones (`DataGenerators.java`).

## 7. Requisitos previos
- JDK 17 instalado
- Maven 3.9+ instalado
- Conexion a internet (API publica ReqRes)

## 8. Instalacion y ejecucion
### 8.1 Ejecutar toda la suite
```powershell
mvn clean test
```

> Si no se informa `apiKey`, el runner ejecuta una feature de pre-check para mantener el pipeline en verde y mostrar el mensaje de configuracion.

### 8.2 Parametrizar entorno opcionalmente
```powershell
mvn clean test -DbaseUrl="https://reqres.in/api" -DapiKey="<tu_api_key_real>" -DmaxResponseTimeMs=3000
```

### 8.3 Ejecutar CRUD real contra ReqRes
```powershell
mvn clean test -DapiKey="<tu_api_key_real_de_app.reqres.in>"
```

## 9. Reportes
Tras la ejecucion, revisar:
- `target/karate-reports/karate-summary.html`
- `target/surefire-reports`

## 10. CI/CD
El workflow `/.github/workflows/ci.yml` ejecuta:
1. Checkout
2. Setup Java 17
3. Maven test
4. Publicacion de reportes como artifact

## 11. Antipatrones cubiertos
Ver `docs/anti-patterns.md` para ejemplos de malas practicas y su correccion:
- Hardcoded IDs
- Dependencias entre pruebas
- Datos compartidos
- Features gigantes
- Assertions insuficientes

## 12. Escalabilidad del framework
Para crecer de demo a framework empresarial:
- Incorporar capas por dominio (`features/accounts`, `features/payments`, etc.)
- Separar environments (`dev`, `qa`, `stg`) con perfiles
- Integrar test doubles/contract mocks para reducir dependencia externa
- Agregar quality gates (coverage de escenarios criticos, SLAs, flaky checks)
- Publicar reportes historicos (Allure, ReportPortal, Elastic)

## 13. Proximos pasos sugeridos
- Agregar autenticacion real (OAuth2/JWT) cuando el sistema lo requiera.
- Expandir casos negativos y reglas de negocio especificas.
- Integrar pruebas de seguridad API (cabeceras, authz, abuso basico).
- Ejecutar en pipeline multi-entorno con matrices de configuracion.

---

Proyecto pensado como base real de entrenamiento para equipos de QA, desarrollo y arquitectura de automatizacion.

