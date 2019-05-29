*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Search_Table}    xpath=//table[contains(@class, 'table')]
${Search_Details}    xpath=//button[text()='Details']

*** Keywords ***
Search.I verify table with data loads
    wait until page contains element    ${Search_Table}
    element should be visible    ${Search_Details}

Search.Click Details for Hotel ${HotelName}
    click element    xpath=//b[text()='${HotelName}']/ancestor::td//button[text()='Details']