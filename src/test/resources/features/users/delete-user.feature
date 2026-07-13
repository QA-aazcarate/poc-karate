Feature: User management - Delete user

  Background:
    * url baseUrl
    * call read('classpath:features/common/require-api-key.feature')
    * def targets = read('classpath:data/users/update-delete-targets.json')

  Scenario: Delete User Successfully
    Given path 'users', targets.deletableUserId
    When method delete
    Then status 204
    And match response == ''
    And assert responseTime < maxResponseTimeMs

