*** Settings ***
Library    SeleniumLibrary
Resource    ../common.robot
*** Variables ***
${username}    abc@yahoo.com
${password}    password@123
*** Keywords ***
Login to CRM
    Click Link    Sign In
    Input Text     email-id    ${username}
    Input Password    password    ${password}
    Click Button    Submit
Create a new customer
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
Verify that the customer was added successfully
     Wait Until Page Contains    text=Success! New customer added.

