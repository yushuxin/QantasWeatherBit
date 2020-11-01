Feature: get Current Weather Data based on Postal Code

  Assume postal code should be 2 to 7 digits, which should not includes characters.

  Scenario Outline: get current weather data based on postal code
    Given url testUrlBase + 'current'
    And params { postal_code: <postalCode>, key: '#(key)' }
    When method get
    Then status <status>

    Examples: valid
      | postalCode | status |
      | 12         | 200    |
      | 123        | 200    |
      | 1234       | 200    |
      | 12345      | 200    |
      | 123456     | 200    |
      | 1234567    | 200    |

    Examples: invalid
      | postalCode | status |
      | 1          | 204    |
      | 12345678   | 204    |
      | aaaa       | 204    |
      | 123$       | 204    |


  @smoke
  Scenario: get current weather data with valid postal code
    validate the schema of weather object

    * def isValidResponse = read('schema/weatherResponse.js')
    Given url testUrlBase + 'current'
    And params { postal_code: '2126', key: '#(key)' }
    When method get
    Then status 200
    And match response.data[0] contains { city_name: "Arroyo Seco" }
    And match response.data[0] contains { weather: '#notnull' }
    And match response.data[0].weather == isValidResponse


