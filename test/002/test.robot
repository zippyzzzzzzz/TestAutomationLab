*** Settings ***
Documentation     Test Scenario: UAT-Lab04-002 Workshop Registration (Negative Test)
Library           SeleniumLibrary
Suite Setup       Open Registration Page
Suite Teardown    Close Browser

*** Variables ***
${URL}        http://localhost:7272/Registration.html
${BROWSER}    chrome

*** Test Cases ***
UAT-Lab04-002-01 Empty First Name
    Fill Registration Form    ${EMPTY}    Sodyod    CS KKU    somyod@kkumail.com    091-001-1234
    Submit Registration
    Error Message Should Be    *Please enter your first name!!
    Capture Page Screenshot

UAT-Lab04-002-02 Empty Last Name
    Fill Registration Form    Somyod    ${EMPTY}    CS KKU    somyod@kkumail.com    091-001-1234
    Submit Registration
    Error Message Should Be    *Please enter your last name!!
    Capture Page Screenshot

UAT-Lab04-002-03 Empty First Name And Last Name
    Fill Registration Form    ${EMPTY}    ${EMPTY}    CS KKU    somyod@kkumail.com    091-001-1234
    Submit Registration
    Error Message Should Be    *Please enter your name!!
    Capture Page Screenshot

UAT-Lab04-002-04 Empty Email
    Fill Registration Form    Somyod    Sodsai    CS KKU    ${EMPTY}    091-001-1234
    Submit Registration
    Error Message Should Be    *Please enter your email!!
    Capture Page Screenshot

UAT-Lab04-002-05 Empty Phone Number
    Fill Registration Form    Somyod    Sodsai    CS KKU    somyod@kkumail.com    ${EMPTY}
    Submit Registration
    Error Message Should Be    *Please enter your phone number!!
    Capture Page Screenshot

UAT-Lab04-002-06 Invalid Phone Number
    Fill Registration Form    Somyod    Sodsai    CS KKU    somyod@kkumail.com    1234
    Submit Registration
    Error Message Should Be    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Capture Page Screenshot

*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Workshop Registration

Fill Registration Form
    [Arguments]    ${fname}    ${lname}    ${org}    ${email}    ${phone}
    Clear Element Text    id=firstname
    Clear Element Text    id=lastname
    Clear Element Text    id=organization
    Clear Element Text    id=email
    Clear Element Text    id=phone
    Input Text    id=firstname      ${fname}
    Input Text    id=lastname       ${lname}
    Input Text    id=organization   ${org}
    Input Text    id=email          ${email}
    Input Text    id=phone          ${phone}

Submit Registration
    Click Button    id=registerButton

Error Message Should Be
    [Arguments]    ${message}
    Page Should Contain    ${message}
