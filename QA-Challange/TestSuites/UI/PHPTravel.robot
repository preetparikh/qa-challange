*** Settings ***
Resource        QA-Challange/Resources/StepDefinitions/BddKeywords.robot
Resource        Core/BaseTest.robot

Test Setup      Base Web Test Setup     Chrome
Test Teardown   Base Web Test Tear Down

*** Test Cases ***
AC1. I want to be able book hotels, flights or tours

TC1: Verify user can book a Hotel/Flight/Tours on PHP Travel
    Given I am on PHP Travel Website
    When HomePage.I verify tabs available for booking
    Then I should be able to navigate to Hotels/Flights/Tours tabs

TC2: Book a hotel on PHP Travel