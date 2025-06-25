*** Settings ***
Library    SeleniumLibrary
#Resource    ../resources/first.robot
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
    Open Browser    ${url}    ${browser}
    Set Selenium Timeout  2s
    Set Selenium Speed    0.2s
    #Set Window Position    341    169
    #Set Window Size    1935    1090
    Click Link    Sign In
    Input Text     email-id    ${username}
    Input Password    password    ${password}
    Click Button    Submit
    Wait Until Page Contains    Our Happy Customers
    Click Link    id=new-customer
    Wait until page contains     Add Customer
    Input Text    id=EmailAddress    test@yahoo.com
    Input Text    id=FirstName    Joh
    Input Text    id=LastName    are
    Input Text    id=City    Springfield
    Select From List By Value    id=StateOrRegion    IL
    Select Radio Button    gender    male
    Select Checkbox    name=promos-name
    Click Button    Submit
    Wait Until Page Contains    text=Success! New customer added.
    Close All Browsers
*** Keywords ***