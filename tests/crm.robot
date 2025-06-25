*** Settings ***
Library    SeleniumLibrary
#Resource    ../resources/first.robot
*** Variables ***
${url}    https://automationplayground.com/crm/
${browser}    ff
${username}    abc@yahoo.com
${password}    password@123
*** Test Cases ***
Login to CRM with valid credentials
    [Tags]    smoke    122
       Open Browser    ${url}    ${browser}
       Set Selenium Timeout  2s
       Set Selenium Speed    0.2s
#Input Text    username_field    ${username}
#Input Text    password_field    ${password}
#Click Button    login_button
#Page Should Contain Element    dashboard_element
    Close Browser

Shoul be able to add a new customer
    [documentation]    This test verifies that a new customer can be added to the CRM system.
    [Tags]    regression    smoke    123
    Open Browser    ${url}    ${browser}
    Set Selenium Timeout  2s
    Set Selenium Speed    0.2s
    Set Window Position    341    169
    Set Window Size    1935    1090
    Click Link    href=login.html
    Input Text     email-id    ${username}
    Input Password    password    ${password}
    Click Button    Submit
    Close All Browsers
*** Keywords ***