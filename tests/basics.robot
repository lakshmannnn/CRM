*** Settings ***
Library    SeleniumLibrary
#$ robot --loglevel trace -d results -i 124 -v browser:chrome -t "Should be able to add a new customer usig Gherkin syntax" tests/crm.robot
#$ robot --loglevel trace -d results -i 125 -v browser:chrome  tests/crm.robot
*** Variables ***
${URL}    https://automationplayground.com/crm/
${BROWSER}    ff
${USERNAME}    abc@yahoo.com
${PASSWORD}    password@123

*** Keywords ***
Launch browser by passing variables
    [Arguments]    ${url}    ${browser}
     Open Browser    ${url}    ${browser}
*** Test Cases ***
 Open amazon website by Passing Variables to keywords
     [Documentation]    This test verifies that the passing of variables to keywords works as expected.
     [Tags]    regression    smoke    126
     Launch browser by passing variables    https://www.amazon.co.uk/    ff
     Close All Browsers

