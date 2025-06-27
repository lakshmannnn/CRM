*** Settings ***
Resource    ../resources/POM/crmGUI.robot
Resource    ../resources/common.robot
Suite Setup    common.Go to CRM and Setup Selenium Defaults
Suite Teardown    common.Close the Browser
Test Setup    common.Mockup test data
Test Teardown    common.Delete Mockup data
#$ robot --loglevel trace -d results -i 124 -v browser:chrome -t "Should be able to add a new customer usig Gherkin syntax" tests/crm.robot
#$ robot --loglevel trace -d results -i 125 -v browser:chrome  tests/crm.robot
*** Variables ***
${URL}    https://automationplayground.com/crm/
${BROWSER}    ff
${USERNAME}    abc@yahoo.com
${PASSWORD}    password@123
*** Test Cases ***
Login to CRM with valid credentials
    [Tags]    smoke    122
       Open Browser    ${URL}    ${browser}
       Set Selenium Timeout  2s
       Set Selenium Speed    0.2s
#Input Text    username_field    ${USERNAME}
#Input Text    password_field    ${PASSWORD}
#Click Button    login_button
#Page Should Contain Element    dashboard_element
    Close Browser

Should be able to add a new customer
    [documentation]    This test verifies that a new customer can be added to the CRM system.
    [Tags]    regression    smoke    123
    crmGUI.Login to CRM
    crmGUI.Create a new customer
    crmGUI.Verify that the customer was added successfully
Should be able to add a new customer using Gherkin syntax
    [documentation]    This test verifies that a new customer can be added to the CRM system.
    [Tags]    regression    smoke    124
    Given crmGUI.Login to CRM
    When crmGUI.Create a new customer
    And Log    this is for future use
    Then crmGUI.Verify that the customer was added successfully

Variables and scope
    [Documentation]    This test verifies that the types of variables and their scope work as expected.
    [Tags]    regression    smoke    125
    ${my_var} =    Set Variable    This is a local variable
    Log    Local variable: ${my_var}
    @{my_list_var} =    Create List    Orrange    Apple   tiger
    Log     my list variable:${my_list_var}[2]

 Launch CRM app by Passing Variables to keywords
     [Documentation]    This test verifies that the passing of variables to keywords works as expected.
     [Tags]    regression    smoke    126
     common.Open the CRM application by passing variables    www.amazon.co.uk    Chrome