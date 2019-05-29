*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Invoice_PayNow}    xpath=//button[text()="Pay Now"]

*** Keywords ***
Invoice.Verify Invoice
    [Arguments]    ${hotelname}
    wait until page contains element    ${Invoice_PayNow}    15s
    page should contain element    xpath=//div[normalize-space()="Unpaid"]
    page should contain element    xpath=//td[normalize-space()="${hotelname}"]