Feature: Abuse cases should get error in response

  @smoke
  Scenario: get current weather data without key
    Given url testUrlBase + 'current'
    And params { postal_code: '2126' }
    When method get
    Then status 403
    And match response == {"error":"API key is required."}

  @smoke
  Scenario: get current weather data without parameter
    Given url testUrlBase + 'current'
    And params { key: '#(key)' }
    When method get
    Then status 400
    And match response == {"error":"Invalid Parameters supplied."}