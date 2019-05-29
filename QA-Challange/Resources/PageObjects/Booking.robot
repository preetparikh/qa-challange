*** Settings ***
Library    SeleniumLibrary
Resource   Core/UIUtilities.robot

*** Variables ***
${Booking_FirstName}    xpath=//input[@name="firstname"]
${Booking_LastName}    xpath=//input[@name="lastname"]
${Booking_Email}    xpath=//input[@name="email"]
${Booking_ConfirmEmail}    xpath=//input[@name="confirmemail"]
${Booking_Mobile}    xpath=//input[@name="phone"]
${Booking_Address}    xpath=//input[@name="address"]
${Booking_Country_Select}    xpath=//span[text()="Select Country"]
${Booking_Country_Australia}    xpath=//div[text()="Australia"]
${Booking_ConfirmBooking}    xpath=//button[text()="CONFIRM THIS BOOKING"]

*** Keywords ***
Booking.Fill in Personal Details
    wait until page contains element    ${Booking_FirstName}
    input text    ${Booking_FirstName}    Peter
    input text    ${Booking_LastName}    Parker
    input text    ${Booking_Email}    peterparker@phptravels.net
    input text    ${Booking_ConfirmEmail}    peterparker@phptravels.net
    input text    ${Booking_Mobile}    0400000000
    input text    ${Booking_Address}    33 Alfred Street
    click element    ${Booking_Country_Select}
    click element    ${Booking_Country_Australia}

Booking.Click Book Now
    Utilities.Scroll to Element    ${Booking_ConfirmBooking}
    click element    ${Booking_ConfirmBooking}