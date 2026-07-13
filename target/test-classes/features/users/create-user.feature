Feature: User management - Create user

  Background:
    * url baseUrl
    * call read('classpath:features/common/require-api-key.feature')
    * def DataGenerators = Java.type('utils.DataGenerators')
    * def createSchema = read('classpath:data/schemas/create-user-response-schema.json')

  Scenario: Create User Successfully
    Given path 'users'
    * def requestPayload = read('classpath:payloads/users/create-user-base.json')
    * requestPayload.name = DataGenerators.randomName('workshop-user')
    * requestPayload.job = DataGenerators.randomJob()
    And request requestPayload
    When method post
    Then status 201
    And match header Content-Type contains 'application/json'
    And match response == createSchema
    And match response.name == requestPayload.name
    And match response.job == requestPayload.job
    And assert responseTime < maxResponseTimeMs

