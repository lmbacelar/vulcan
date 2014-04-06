Feature: ITS-90 Computation

    As a   temperature metrologist
    In     order to use ITS-90 PRT's
    I want to get temperature from resistance and vice-versa

  Scenario: Get temperature from resistance according to ITS-90
    Given I send and accept JSON
    When I POST to "/its90/temperature_computations" with:
    """
    { "resistance":"25.0",
      "sub_range":"11" }
    """
    Then the response status should be "201"
    And the JSON response at "temperature" should be 0.0

  # Scenario: Get resistance from temperature according to ITS-90
  #   Given I send and accept JSON
  #   When I POST to "/its90/resistance_computations" with:
  #   """
  #     { "temperature":"0.0" }
  #   """
  #   Then the response status should be "201"
  #   And the JSON response at "resistance" should be 25.0
