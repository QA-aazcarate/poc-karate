Feature: User management - Update user

  Background:
    * url baseUrl
    * call read('classpath:features/common/require-api-key.feature')
    * def DataGenerators = Java.type('utils.DataGenerators')
    * def updateSchema = read('classpath:data/schemas/update-user-response-schema.json')
    * def targets = read('classpath:data/users/update-delete-targets.json')

  Scenario: Update User Successfully
    Given path 'users', targets.updatableUserId
    * def requestPayload = read('classpath:payloads/users/update-user-base.json')
    * requestPayload.name = DataGenerators.randomName('updated-user')
    * requestPayload.job = DataGenerators.randomJob()
    And request requestPayload
    When method put
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == updateSchema
    And match response.name == requestPayload.name
    And match response.job == requestPayload.job
    And assert responseTime < maxResponseTimeMs

