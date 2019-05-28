*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Keywords ***
Base Web Test Setup
    [Arguments]    ${ENVIRONMENT_BROWSERTYPE}

    open browser    about:    browser=${ENVIRONMENT_BROWSERTYPE}
    maximize browser window
    ${originalImplicitWait} =    set selenium implicit wait    5 seconds
    set test variable    ${originalImplicitWait}
    delete all cookies

Base Web Test Tear Down
    close all browsers

Base API Test Setup
    delete all sessions

Base API Test Tear Down
    delete all sessions
