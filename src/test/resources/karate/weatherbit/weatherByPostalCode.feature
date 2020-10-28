Feature: get Current Weather Data based on Postal Code

  Scenario Outline: get current weather data based on postal code and country code
    Given url testUrlBase
    And params { postal_code: <postalCode>, country: <country>, key: '#(apiKey)' }
    When method get
    Then status <status>

    Examples: correct postal code and country
      | postalCode | country | status |
      | 2126       | AU      | 200    |

    Examples: incorrect postal code and country
      | postalCode | country | status |
      | 2a'126     | US      | 204    |


#  Scenario: get current weather data based on correct postal code and country code
#    Given url testUrlBase
#    And params { postal_code: '2126', country: 'AU', key: '#(apiKey)' }
#    When method get
#    Then status 200
#    And match response.data[0] contains { city_name: "West Pennant" }
#    And match response.data[0] contains { weather: '#notnull' }
#
#  Scenario: get current weather data based on correct postal code and country code
#    Given url testUrlBase
#    And params { postal_code: 'aaaa', country: 'AU', key: '#(apiKey)' }
#    When method get
#    Then status 204
#    And match response == ""
