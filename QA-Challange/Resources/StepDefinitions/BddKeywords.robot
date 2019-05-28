*** Settings ***
Resource    QA-Challange/Resources/PageObjects/HomePage.robot

*** Keywords ***
I am on PHP Travel Website
    go to    ${ENVIRONMENT_PHPTRAVEL_HOST}
    wait until page contains element    ${Home_Logo}

I should be able to navigate to Hotels/Flights/Tours tabs
    HomePage.Navigate to Hotels Tab
    HomePage.Navigate to Flights Tab
    HomePage.Navigate to Tours Tab