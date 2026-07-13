# Riesgos y Antipatrones en Automatizacion

## 1) Hardcoded IDs (mala practica)
```gherkin
# MAL: valor fijo en cada feature
Given path 'users', 2
```
**Problema**: dificil de mantener y rompe facil ante cambios.

**Mejor practica aplicada en la demo**:
```gherkin
* def targets = read('classpath:data/users/update-delete-targets.json')
Given path 'users', targets.updatableUserId
```

## 2) Dependencias entre pruebas (mala practica)
```gherkin
# MAL: este escenario depende del id creado en otro escenario
* def userId = call read('create-user.feature')
```
**Problema**: orden de ejecucion fragil y baja confiabilidad.

## 3) Datos compartidos mutables (mala practica)
```gherkin
# MAL: reusar el mismo usuario global para todas las pruebas
```
**Problema**: condiciones de carrera e intermitencia.

## 4) Feature gigante (mala practica)
```gherkin
# MAL: CRUD completo en una sola feature con 500+ lineas
```
**Problema**: baja legibilidad, mantenimiento costoso.

## 5) Assertions insuficientes (mala practica)
```gherkin
Then status 200
# y nada mas
```
**Problema**: no valida contrato ni reglas de negocio.

## Reglas de oro aplicadas
- 1 feature = 1 comportamiento de negocio.
- Escenarios independientes.
- Datos externos y versionados.
- Assertions funcionales + contrato + performance basica.

