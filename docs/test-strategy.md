# Test Strategy - User Management API (ReqRes)

## 1. Objetivo
Definir una estrategia de calidad para validar el flujo CRUD de usuarios (Create, Read, Update, Delete) en la API REST `https://jsonplaceholder.typicode.com`.

## 2. Alcance
- **Incluido**: endpoints de usuarios, contratos de respuesta, tiempos de respuesta, headers y reglas de negocio basicas.
- **No incluido**: seguridad profunda (OWASP), pruebas de carga real, pruebas de UI.

## 3. Enfoque de pruebas
- **Nivel principal**: API testing automatizado con Karate.
- **Tipo de validaciones**:
  - Funcionales (status, body, reglas de negocio)
  - Contract testing (tipos de datos y estructura)
  - Non-functional basico (response time)
- **Data strategy**: datos base versionados en `src/test/resources/data` y payloads reutilizables en `src/test/resources/payloads`.

## 4. Criterios de entrada
- Ambiente disponible (ReqRes)
- Java 17 y Maven instalados
- Pipeline con permisos de ejecucion

## 5. Criterios de salida
- 100% de escenarios criticos ejecutados
- 0 fallos bloqueantes
- Reporte generado en `target/karate-reports`

## 6. Priorizacion
- **P1**: crear y consultar usuario
- **P2**: actualizar y eliminar usuario
- **P3**: casos negativos y robustez

## 7. Trazabilidad
Requerimiento -> Test Scenario -> Test Case -> Feature Karate -> Evidencia de ejecucion.

## 8. Herramientas
- Java 17
- Maven
- Karate + JUnit 5
- GitHub Actions

## 9. Principios QA representados
- Shift-left: diseno de pruebas antes de automatizar.
- Risk-based testing: foco en operaciones de mayor impacto.
- Test pyramid: pruebas API como capa rapida y estable.

