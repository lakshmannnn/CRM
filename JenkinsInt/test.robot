*** Settings ***
Library           SeleniumLibrary
Resource          resourceTest.resource

*** Variables ***
${url}            https://www.bbc.co.uk/
${browser}        chrome

*** Test Cases ***
compare
    Compare2Var
