*** Settings ***
Documentation     Test Scenario: UAT-Lab04-001 Workshop Registration
Library           SeleniumLibrary

*** Variables ***
${URL}        http://localhost:7272/Registration.html
${BROWSER}    Chrome

*** Test Cases ***
UAT-Lab04-001-TC01 Register Success With Organization
    [Documentation]    Register success with complete information
    Open Registration Page
    Fill Registration Form    Somyod    Sodsai    CS KKU    somyod@kkumail.com    091-001-1234
    Submit Registration
    Registration Should Be Successful
    Capture Page Screenshot
    Close Browser

UAT-Lab04-001-TC02 Register Success Without Organization
    [Documentation]    Register success without organization info
    Open Registration Page
    Fill Registration Form    Somyod    Sodsai    ${EMPTY}    somyod@kkumail.com    091-001-1234
    Submit Registration
    Registration Should Be Successful
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Workshop Registration

Fill Registration Form
    [Arguments]    ${fname}    ${lname}    ${org}    ${email}    ${phone}
    Input Text    id=firstname      ${fname}
    Input Text    id=lastname       ${lname}
    Input Text    id=organization   ${org}
    Input Text    id=email          ${email}
    Input Text    id=phone          ${phone}

Submit Registration
    Click Button    id=registerButton

Registration Should Be Successful
    Location Should Contain    Success.html

Error Message Should Be
    [Arguments]    ${message}
    Page Should Contain    ${message}
