*** Settings ***
Resource        QA-Challange/Resources/StepDefinitions/BddKeywords.robot
Resource        Core/BaseTest.robot

Test Setup      Base Web Test Setup     Chrome
Test Teardown   Base Web Test Tear Down

*** Test Cases ***
TC1: Verify user can book a Hotel/Flight/Tours on PHP Travel
    Given I am on PHP Travel Website
    When HomePage.I verify tabs available for booking
    Then I should be able to navigate to Hotels/Flights/Tours tabs

TC2: Book a hotel on PHP Travel
    Given I am on PHP Travel Website
    And I navigate to Hotels tab
    When I fill in search details and click search    ${None}    22/05/2019    25/06/2019
    And I should see a list of Hotels matching search criteria
    Then I can select a Hotel from list    Rendezvous Hotels
    And I can select a room to book    Triple Rooms
    And I can confirm my booking
    And I can see my receipt    Rendezvous Hotels
