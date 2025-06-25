*** Settings ***
Library   SeleniumLibrary
Resource   ../resources/POM/crmGUI.robot
*** Variables ***
${url}    https://automationplayground.com/crm/
${browser}    ff
*** Keywords ***
Go to CRM and Setup Selenium Defaults
    Open the CRM application
    Set Selenium Defaults
Set Selenium Defaults
    Set Selenium Timeout  2s
    Set Selenium Speed    0.2s
    #Set Window Position    341    169
    #Set Window Size    1935    1090
Open the CRM application
     Open Browser    ${url}    ${browser}
Close the browser
       Close All Browsers
Mockup test data
    Log    this test setup is for future use
Delete Mockup dasta
    Log    this test teardown is for future use