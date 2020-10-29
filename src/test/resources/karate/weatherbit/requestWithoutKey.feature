Feature: Request without api key should get error in response

  @smoke
  Scenario: get current weather data without key
    Given url testUrlBase
    And params { postal_code: '2126' }
    When method get
    Then status 200
    And match response == {"error":"API key is required."}