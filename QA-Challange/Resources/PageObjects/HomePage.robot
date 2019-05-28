*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Home_Logo}    xpath=//img[contains(@alt, 'PHPTRAVELS | Travel Technology Partner')]
${Home_Flights_Tab}    xpath=//img[contains(@alt, 'PHPTRAVELS | Travel Technology Partner')]
${Home_Hotels_Tab}    xpath=//img[contains(@alt, 'PHPTRAVELS | Travel Technology Partner')]
${Home_Tours_Tab}    xpath=//img[contains(@alt, 'PHPTRAVELS | Travel Technology Partner')]

*** Keywords ***
HomePage.I verify tabs available for booking
    page should contain element    ${Home_Flights_Tab}
    page should contain element    ${Home_Hotels_Tab}
    page should contain element    ${Home_Tours_Tab}

HomePage.Navigate to ${tabname} Tab
    click element    ${Home_${tabname}_Tab}
    wait until page contains element    xpath=//li[contains(@class, 'active')]//span[normalize-space()="${tabname}"]
    page should contain element    xpath=//li[contains(@class, 'active')]//span[normalize-space()="${tabname}"]