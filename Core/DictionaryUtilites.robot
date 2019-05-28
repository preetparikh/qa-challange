*** Settings ***
Library  Collections
Library  String
Library  Core/Libraries/CommonUtilities.py

*** Keywords ***
DictionaryUtilities.getValueByKeyPath
    [Documentation]    This function takes 2 arguments - a dictionary object and a list of keys. The list of keys is read
    ...    in a sequential manner to go down the path and find the key.

    [Arguments]    ${dict_to_parse}    ${list_key_path}
    ${length}=    get length    ${list_key_path}
    ${dict_temp}=    set variable    ${dict_to_parse}
    :FOR    ${index}    IN RANGE    0    ${length}
    \    ${key}    Get From List    ${list_key_path}    ${index}
#    \    ${flag} =    get lines containing string     ${key}    =
#    \    @{splitValues} =    run keyword if    "${flag}" == "${key}"    split string    ${key}    =
    \    ${dict_temp_type} =    evaluate    type(${dict_temp})
#    \    ${dict_temp} =    run keyword if    "${flag}" == "${key}"    DictionaryUtilities.getValueByKeyPathAndMatchingKeyValue    ${dict_temp}    ${splitValues[0]}    ${splitValues[1]}
    \    ${dict_temp} =    run keyword if    "${dict_temp_type}" == "<type 'list'>"    DictionaryUtilities.GetValueFromListOfCommonDictionaries    ${dict_temp}    ${key}
    \    ...    ELSE    get variable value    ${dict_temp['${key}']}
    [Return]    ${dict_temp}

DictionaryUtilities.GetValueFromListOfCommonDictionaries
    [Documentation]    This is a private keyword and should not be used. This keyword is used by
    ...                 This keyword gets a specific key value in a list that has common dictionaries
    [Arguments]    ${tempDictionary}    ${key}=first
    ${matchFlag} =    set variable    ${False}
    ${length} =    get length    ${tempDictionary}
    ${extractedValue} =    set variable    ${None}

    run keyword and return if    "${key}" == "first"    ${tempDictionary[0]}

    :FOR    ${index}    IN RANGE    0    ${length}
    \    ${tempDict} =    set variable    ${tempDictionary[${index}]}
    \    ${extractedValue} =    get variable value    ${tempDict["${key}"]}
    \    continue for loop if    '${extractedValue}' == '${None}'
    \    run keyword unless    "${extractedValue}" == "None"    exit for loop

    [Return]    ${extractedValue}