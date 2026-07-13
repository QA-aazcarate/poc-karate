# Test Cases - User Management API

> **Test Case = como validarlo**.

## TC-001 - Create User Successfully
- **Scenario asociado**: SCN-001
- **Precondicion**: API disponible
- **Given** payload valido desde `payloads/users/create-user-base.json`
- **When** se ejecuta `POST /users`
- **Then** status `201`
- **And** header `Content-Type` contiene `application/json`
- **And** el body cumple esquema `create-user-response-schema.json`
- **And** retorna `id` y `createdAt`
- **And** tiempo de respuesta menor al umbral

## TC-002 - Get Existing User By ID
- **Scenario asociado**: SCN-002
- **Precondicion**: IDs de prueba en `data/users/get-user-positive.json`
- **Given** id existente
- **When** se ejecuta `GET /users/{id}`
- **Then** status `200`
- **And** contrato de respuesta correcto
- **And** `response.data.id` coincide con el id solicitado

## TC-003 - Get Non Existing User By ID
- **Scenario asociado**: SCN-003
- **Given** id inexistente
- **When** se ejecuta `GET /users/{id}`
- **Then** status `404`
- **And** body vacio `{}`

## TC-004 - Update User Successfully
- **Scenario asociado**: SCN-004
- **Given** payload valido de actualizacion
- **When** se ejecuta `PUT /users/{id}`
- **Then** status `200`
- **And** campos `name`, `job`, `updatedAt` presentes y validos

## TC-005 - Delete User Successfully
- **Scenario asociado**: SCN-005
- **Given** id eliminable
- **When** se ejecuta `DELETE /users/{id}`
- **Then** status `204`
- **And** body vacio

## TC-006 - Header and Response Time Validation
- **Scenario asociado**: SCN-006
- **Given** cualquier operacion CRUD
- **When** responde la API
- **Then** `Content-Type` esperado
- **And** response time menor a `maxResponseTimeMs`

