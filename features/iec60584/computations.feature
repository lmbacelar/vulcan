Feature: IEC 60584 Computation

    As a   temperature metrologist
    In     order to use IEC 60584 Thermocouples
    I want to get temperature from emf and vice-versa

  Scenario: Get temperature from emf according to IEC 60584
    Given I send and accept JSON
    When I POST to "/iec60584/temperature_computations" with:
    """
    {
      "emf":"0.0",
      "type":"K"
    }
    """
    Then the response status should be "201"
    And the JSON response at "temperature" should be 0.0

  Scenario: Get emf from temperature according to IEC 60584
    Given I send and accept JSON
    When I POST to "/iec60584/emf_computations" with:
    """
    { 
      "temperature":"0.0",
      "type":"K"
    }
    """
    Then the response status should be "201"
    And the JSON response at "emf" should be 0.0
