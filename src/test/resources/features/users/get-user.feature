Feature: User management - Get user

  Background:
    * url baseUrl
    * call read('classpath:features/common/require-api-key.feature')
    * def getSchema = read('classpath:data/schemas/get-user-response-schema.json')

  Scenario Outline: Get Existing User By ID
    Given path 'users', <userId>
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == getSchema
    And match response.data.id == <userId>
    And match response.data.email contains <expectedDomain>
    And assert responseTime < maxResponseTimeMs

    Examples:
      | read('classpath:data/users/get-user-positive.json') |

  Scenario Outline: Get Non Existing User By ID
    Given path 'users', <userId>
    When method get
    Then status 404
    And match response == {}
    And assert responseTime < maxResponseTimeMs

    Examples:
      | read('classpath:data/users/get-user-negative.json') |

