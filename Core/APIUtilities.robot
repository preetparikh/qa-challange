*** Settings ***
Library    Collections
Library    XML
Library    RequestsLibrary
Library    String
Library    APILib.py
Library    ExtendedSudsLibrary.py
Library    xmltodict
Library    OperatingSystem
Library    Core/Libraries/CommonUtilities.py
Library    Core/Libraries/JSONHelper.py
Library    Core/Libraries/RequestsKeywordsExtentions.py

*** Variables ***
${json}    None
${tRespDict}    None
${PROXIES}    None
${SESSION}    APITEST
${ISWSDL}    ${False}

*** Keywords ***
##################################################### Create Session ##################################################
APIUtilities.Create API Session
    [Documentation]    Creates a session to a supplied URL with headers and parameters
    [Arguments]    ${URL}    ${verify}=False
    create session    ${SESSION}    ${URL}    verify=${verify}

############################################### GET Request ############################################################
APIUtilities.Send Get Request and return dictionary
    [Documentation]    Sends a get request to the opened session
    [Arguments]    ${URI}    ${HEADERS}=${None}    ${PARAMS}=${None}    ${Result}=200    ${ignoreResponseCode}=False
    ${response}    APIUtilities.Send Rest Get Request    ${URI}    ${HEADERS}    ${PARAMS}    ${Result}    ${ignoreResponseCode}
    [Return]    ${response}

APIUtilities.Send Rest Get Request
    [Documentation]    Sends a get request to the opened session
    [Arguments]    ${URI}    ${HEADERS}    ${PARAMS}    ${Result}=200    ${ignoreResponseCode}=False
    ${resp}=    get request    ${SESSION}    ${URI}    headers=${HEADERS}    params=${PARAMS}
    log  json: resp.content:: ${resp.content}  level=DEBUG  console=yes
    run keyword if    '${ignoreResponseCode}' == 'False'    should be equal as strings    ${resp.status_code}    ${Result}
#    ${formattedContent}=   JsonOctalFormatter  ${resp.content}
    ${output}=    To Json    ${resp.content}    pretty_print=True
    log    ${output}
    set test variable    ${json}    ${output}
    ${RespDict}=    evaluate    json.loads(r'''${json}''')    json
    ${ReturnLength}=  get length    ${json}
    ${CheckLength}=  evaluate    ${ReturnLength} > 2
    should be true    ${CheckLength}
    [Return]    ${RespDict}