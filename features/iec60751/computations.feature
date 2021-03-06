Feature: IEC 60751 Computation

    As a   temperature metrologist
    In     order to use Iec 60751 PRT's
    I want to get temperature from resistance and vice-versa

  Scenario: Get temperature from resistance according to IEC 60751
    Given I send and accept JSON
    When I POST to "/iec60751/temperature_computations" with:
    """
      { "resistance":"100.0" }
    """
    Then the response status should be "201"
    And the JSON response at "temperature" should be 0.0

  Scenario: Get resistance from temperature according to IEC 60751
    Given I send and accept JSON
    When I POST to "/iec60751/resistance_computations" with:
    """
      { "temperature":"0.0" }
    """
    Then the response status should be "201"
    And the JSON response at "resistance" should be 100.0
