*** Settings ***
Library    SeleniumLibrary
Resource   Core/UIUtilities.robot

*** Variables ***
${HotelDetails_BookNow}    xpath=//button[normalize-space()="Book Now"]

*** Keywords ***
HotelDetails.Select Room
    [Arguments]    ${roomtype}
    wait until page contains element    xpath=//b[text()='${roomtype}']/ancestor::td//label
    Utilities.Scroll to Element    xpath=//b[text()='${roomtype}']/ancestor::td//label
    click element    xpath=//b[text()='${roomtype}']/ancestor::td//label

HotleDetails.click Proceed
    click element    ${HotelDetails_BookNow}