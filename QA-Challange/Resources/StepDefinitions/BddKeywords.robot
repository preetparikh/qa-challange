*** Settings ***
Resource    QA-Challange/Resources/PageObjects/HomePage.robot
Resource    QA-Challange/Resources/PageObjects/Search.robot
Resource    QA-Challange/Resources/PageObjects/HotelDetails.robot
Resource    QA-Challange/Resources/PageObjects/Booking.robot
Resource    QA-Challange/Resources/PageObjects/Invoice.robot

*** Keywords ***
I am on PHP Travel Website
    go to    ${ENVIRONMENT_PHPTRAVEL_HOST}
    wait until page contains element    ${Home_Logo}

I should be able to navigate to Hotels/Flights/Tours tabs
    HomePage.Navigate to Hotels Tab
    HomePage.Navigate to Flights Tab
    HomePage.Navigate to Tours Tab

I fill in search details and click search
    [Arguments]    ${name}    ${checkindate}    ${checkoutdate}
    HomePage.Fill in details to search for Hotels    ${name}    ${checkindate}    ${checkoutdate}
    Homepage.Click Search Button

I navigate to ${tabname} tab
    HomePage.Navigate to ${tabname} Tab

I should see a list of Hotels matching search criteria
    Search.I verify table with data loads

I can select a Hotel from list
    [Arguments]    ${hotelname}
    Search.Click Details for Hotel ${hotelname}

I can select a room to book
    [Arguments]    ${roomtype}
    HotelDetails.Select Room     ${roomtype}
    HotleDetails.click Proceed

I can confirm my booking
    Booking.Fill in Personal Details
    Booking.Click Book Now

I can see my receipt
    [Arguments]    ${hotelname}
    Invoice.Verify Invoice   ${hotelname}