*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Home_Logo}    xpath=//img[contains(@alt, 'PHPTRAVELS | Travel Technology Partner')]
${Home_Flights_Tab}    xpath=//a[@title='Flights']
${Home_Hotels_Tab}    xpath=//a[@title='Hotels']
${Home_Tours_Tab}    xpath=//a[@title='Tours']
${Home_Hotels_HotelorCity}    xpath=//span[normalize-space()="Search by Hotel or City Name"]
${Home_Hotels_CheckIn}    xpath=//input[@placeholder="Check in"]
${Home_Hotels_CheckOut}    xpath=//input[@placeholder="Check out"]
${Home_Hotels_Search}    xpath=//button[normalize-space()="Search"]

*** Keywords ***
HomePage.I verify tabs available for booking
    page should contain element    ${Home_Flights_Tab}
    page should contain element    ${Home_Hotels_Tab}
    page should contain element    ${Home_Tours_Tab}

HomePage.Navigate to ${tabname} Tab
    click element    ${Home_${tabname}_Tab}
    wait until page contains element    xpath=//li[contains(@class, 'active')]//span[normalize-space()="${tabname}"]
    page should contain element    xpath=//li[contains(@class, 'active')]//span[normalize-space()="${tabname}"]

HomePage.Fill in details to search for Hotels
    [Arguments]    ${name}    ${checkindate}    ${checkoutdate}
    run keyword if    "${name}"!="${None}"    click element    ${Home_Hotels_HotelorCity}
    run keyword if    "${name}"!="${None}"    input text    xpath=//input[@class="select2-offscreen"]    ${name}
    run keyword if    "${checkindate}"!="${None}"    input text    ${Home_Hotels_CheckIn}    ${checkindate}
    run keyword if    "${checkoutdate}"!="${None}"    input text    ${Home_Hotels_CheckOut}    ${checkoutdate}

Homepage.Click Search Button
    click element    ${Home_Hotels_Search}