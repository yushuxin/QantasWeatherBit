
Feature: get Current Weather Data based on Lat and Lon

  @ByLatLon
  Scenario: get Current Weather Data for multiple places in the world based on Lat and Lon
    print apiKey
    Given url testUrlBase
    And params { lat: -450, lon: 2300, key: '#(apiKey)' }
    When method get
    Then status 200
    And match response.data[0].lat == 450
    And match response.data[0].lon == 2300
    And match response.data[0] contains { weather: '#notnull' }


  Scenario: get current weather data based on correct postal code and country code
    Given url testUrlBase
    And params { postal_code: 'aaaa', country: 'AU', key: '#(apiKey)' }
    When method get
    Then status 204
    And match response == ""