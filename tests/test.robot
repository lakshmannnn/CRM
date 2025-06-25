*** Settings ***
Library           SeleniumLibrary
Resource          resources/POM/resourceTest.resource

*** Variables ***
${url}            https://www.bbc.co.uk/
${browser}        chrome

*** Test Cases ***
compare
    Compare2Var

Login
    [Tags]    1
    Open Browser    ${url}    ${browser}
    Close Browser
    [Teardown]    close browser
