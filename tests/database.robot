*** Settings ***
Library       DatabaseLibrary
Test Setup    Connect To My Oracle DB

*** Keywords ***
Connect To My Oracle DB
    Connect To Database
    ...    oracledb
    ...    db_name=db
    ...    db_user=my_user
    ...    db_password=my_pass
    ...    db_host=127.0.0.1
    ...    db_port=1521

*** Test Cases ***
Get All Names
    ${Rows}=    Query    select FIRST_NAME, LAST_NAME from person
    Should Be Equal    ${Rows}[0][0]    Franz Allan
    Should Be Equal    ${Rows}[0][1]    See
    Should Be Equal    ${Rows}[1][0]    Jerry
    Should Be Equal    ${Rows}[1][1]    Schneider

Person Table Contains Expected Records
    ${sql}=    Catenate    select LAST_NAME from person
    Check Query Result    ${sql}    contains    See
    Check Query Result    ${sql}    equals      Schneider    row=1

Wait Until Table Gets New Record
    ${sql}=    Catenate    select LAST_NAME from person
    Check Row Count    ${sql}    >    2    retry_timeout=5s

Person Table Contains No Joe
    ${sql}=    Catenate    SELECT id FROM person
    ...                    WHERE FIRST_NAME= 'Joe'
    Check Row Count    ${sql}   ==    0
