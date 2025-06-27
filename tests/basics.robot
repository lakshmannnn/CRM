*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    OperatingSystem
Library    Collections
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

select options from dialog
    [Documentation]    This test verifies that the select options from "dialog libray" works as expected.
    [Tags]    regression    smoke    130
    ${userInput} =    Get Selection From User    Please select an option from the dropdown list.    Select YES/NO    YES    NO
    Log    User selected: ${userInput}

Create and validate directories and files
    [Documentation]    This test verifies that the "Operating System library" create and validate directories and files works as expected.
    [Tags]    regression    smoke    131
    Create Directory    ${CURDIR}/Folder1
    Should Exist    ${CURDIR}/Folder1
    Create Directory    ${CURDIR}/Folder2
    Should Exist    ${CURDIR}/Folder2
    Create File    path=${CURDIR}/Folder1/test1.txt    content=This is a test file1.
    Should Exist    ${CURDIR}/Folder1/test1.txt
    Create File    path=${CURDIR}/Folder2/test1.txt    content=This is a test file1.
    Should Exist    ${CURDIR}/Folder2/test1.txt
    Create File    path=${CURDIR}/Folder2/test2.txt    content=This is a test file2.
    Should Exist    ${CURDIR}/Folder2/test2.txt
    Create File    path=${CURDIR}/Folder2/test3.txt    content=This is a test file3.
    Should Exist    ${CURDIR}/Folder2/test3.txt

Move files between directories
    [Documentation]    This test verifies that the "Operating System library" create and validate directories and files works as expected.
    [Tags]    regression    smoke    132
    Move File    ${CURDIR}/Folder2/test3.txt    ${CURDIR}/Folder1/test3.txt
    Should Exist    path=${CURDIR}/Folder1/test3.txt
    Should Not Exist    path=${CURDIR}/Folder2/test3.txt

Delete files from directories
    [Documentation]    This test verifies that the "Operating System library" delets and validate directories and files works as expected.
    [Tags]    regression    smoke    133
    Remove Files    ${CURDIR}/Folder1/test1.txt   ${CURDIR}/Folder1/test3.txt     ${CURDIR}/Folder2/test1.txt     ${CURDIR}/Folder2/test2.txt     ${CURDIR}/Folder2/test1.txt
    Remove Directory    ${CURDIR}/Folder1
    Remove Directory    ${CURDIR}/Folder2
    Should Not Exist    ${CURDIR}/Folder1
    Should Not Exist    ${CURDIR}/Folder2
Delete Directories
    [Documentation]    This test verifies that the "Operating System library" delets and validate directories and files works as expected.
    [Tags]    regression    smoke    134
    Remove Directory    ${CURDIR}/Folder1
    Remove Directory    ${CURDIR}/Folder2
    Should Not Exist    ${CURDIR}/Folder1
    Should Not Exist    ${CURDIR}/Folder2