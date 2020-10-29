Feature: get Current Weather Data based on Lat and Lon

  Latitude should be in range of -90 to 90 degree
  Longitude should be in range of -180 to 180 degree
  Both latitude and Longitude should accept both integer and double (max 2 decimal places)

  Scenario Outline: get Current Weather Data based on Lat and Lon
    Given url testUrlBase + 'current'
    And params { lat: <lat>, lon: <lon>, key: '#(key)' }
    When method get
    Then status <status>
    And match response.data[0].lat == <lat>
    And match response.data[0].lon == <lon>
    And match response.data[0] contains { weather: '#notnull' }

    Examples: valid cases
      | lat    | lon     | status |
      | 0      | 0       | 200    |
      | 0      | 180     | 200    |
      | 0      | -180    | 200    |
      | 90     | 0       | 200    |
      | 90     | 180     | 200    |
      | 90     | -180    | 200    |
      | -90    | 0       | 200    |
      | -90    | 180     | 200    |
      | -90    | -180    | 200    |
      | 35.69  | 139.69  | 200    |
      | -33.87 | -151.21 | 200    |

    Examples: invalid cases
      | lat    | lon     | status |
      | 0      | 181     | 204    |
      | 0      | -181    | 204    |
      | 91     | 0       | 204    |
      | -91    | 0       | 204    |

  @smoke
  Scenario: get Current Weather Data with valid lat and lon
    Given url testUrlBase + 'current'
    And params { lat: 0, lon: 0, key: '#(key)' }
    When method get
    Then status 200
    And match response.data[0] contains { weather: '#notnull' }
