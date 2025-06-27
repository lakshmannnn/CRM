*** Settings ***
Resource    ../resources/POM/crmGUI.robot
Resource    ../resources/common.robot
Suite Setup    common.Go to CRM and Setup Selenium Defaults
Suite Teardown    common.Close the Browser
Test Setup    common.Mockup test data
Test Teardown    common.Delete Mockup data
Library    OperatingSystem
#$ robot -d results -i 123 tests/crm.robot
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

Should be able to add a new customer
    [documentation]    This test verifies that a new customer can be added to the CRM system.
    [Tags]    regression    smoke    123
    Given crmGUI.Login to CRM
    When crmGUI.Create a new customer
    And Log    this is for future use
    Then crmGUI.Verify that the customer was added successfully



