# Risk Analysis - User Management API

## Matriz de riesgos

| ID | Riesgo | Probabilidad | Impacto | Mitigacion |
|---|---|---|---|---|
| R-001 | Cambios de contrato en API externa | Media | Alta | Validaciones de esquema y ejecucion diaria en CI |
| R-002 | Inestabilidad de red/servicio externo | Alta | Media | Timeouts, reintentos controlados y umbrales realistas |
| R-003 | Datos no persistentes en API fake | Alta | Media | Pruebas independientes y datos desacoplados |
| R-004 | Falsos positivos por assertions debiles | Media | Alta | Validar status, body, headers, negocio y tiempos |
| R-005 | Acoplamiento entre tests | Media | Alta | Escenarios independientes y sin dependencia de orden |

## Riesgos residuales
- Dependencia de terceros (ReqRes) para disponibilidad.
- Limitaciones funcionales de API de demostracion vs API productiva.

## Principios QA representados
- Risk-based testing.
- Prevencion temprana de regresiones.
- Independencia entre casos de prueba.

