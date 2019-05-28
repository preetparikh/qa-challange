*** Settings ***
Resource         Core/ApiUtilities.robot
Resource         Core/DictionaryUtilities.robot
Test Template    Get Current Temprature
Resource    Core/APIUtilities.robot
Resource    Core/DictionaryUtilites.robot

*** Keywords ***
Get Current Temprature
    [Arguments]    ${postcode}    ${latitude}    ${longitude}    ${country}    ${request_city}
    APIUtilities.Create API Session    http://api.weatherbit.io/v2.0
    ${response}    run keyword if    "${latitude}"!="${NONE}"    APIUtilities.Send Get Request and return dictionary    /current?lat=${latitude}&lon=${longitude}&key=e367790c908944a882a863bd09e642b9    ignoreResponseCode=True
    ...    ELSE IF    "${country}"!="${NONE}"    APIUtilities.Send Get Request and return dictionary    /current?postal_code=${postcode}&country=${country}&key=e367790c908944a882a863bd09e642b9    ignoreResponseCode=True
    ...    ELSE    APIUtilities.Send Get Request and return dictionary    /current?postal_code=${postcode}&key=e367790c908944a882a863bd09e642b9    ignoreResponseCode=True
    ${keypath_tempreture}=    create list    data    temp
    ${tempreture}    DictionaryUtilities.getValueByKeyPath    ${response}    ${keypath_tempreture}
    log    Current Temprature: ${tempreture}
    ${keypath_city}=    create list    data    city_name
    ${response_city}    DictionaryUtilities.getValueByKeyPath    ${response}    ${keypath_city}
    log    City: ${response_city}
    should be equal as strings    ${request_city}    ${response_city}


*** Test Cases ***
Get Current Temprature for Blacktown based on Postcode                          2148    ${NONE}    ${NONE}    ${NONE}    Blacktown
Get Current Temprature for Blacktown based on Postcode and Country              2000    ${NONE}    ${NONE}    AU    Milsons Point
Get Current Temprature for Sydney based on Lat and Long                         ${NONE}    -33.86785    151.20732    ${NONE}    Sydney