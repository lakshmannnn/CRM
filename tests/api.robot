*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get response
    [Documentation]    This test verifies that the GET request works as expected.
    [Tags]    regression    smoke    136
    comment    Create Session    my_api    https://jsonplaceholder.typicode.com
    comment    ${resp} =    GET    my_api    /posts/10
   ${resp} =    GET    htps://jsonplaceholder.typicode.com/posts/10
    Should Be Equal As Strings    ${resp.userId}    10
