Feature: IEC 60751 Resistance Computation

    As a   temperature metrologist
    In     order to use Iec 60751 PRT's
    I want to get resistance from temperature

  Scenario: Get resistance from temperature according to IEC 60751
    Given I send and accept JSON
    When I POST to "/iec60751/resistance_computations" with:
    """
      { "temperature":"0.0" }
    """
    Then the response status should be "201"
    And the JSON response at "resistance" should be 100.0
