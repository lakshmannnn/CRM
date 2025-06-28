*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
** Variables ***
${BASE_URL}       https://apiforshopsinventorymanagementsystem-qnkc.onrender.com
${TOKEN}          Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTJiY2NlZDVkZGIzYjkyYmY5MTYxMSIsImlhdCI6MTc1MTA2ODIyNywiZXhwIjoxNzUxMDcxODI3fQ.kW5W85qmnzj1W4F-E3Ro2gLYUqCofS7qg3bhtCPyhwM
${HEADERS}        {"Authorization": "${TOKEN}"}
${BODY}        {"name": "Lakshman-prod1", "price": 199, "productType":"laptops", "quantity":299}
# using above BODY the post API throws error as it expects the dictionary data.
*** Test Cases ***
Create Product - POST Data using 'Cypress API testing API'
    [Documentation]    This test uses the API used for 'Cypress API testing'. This test verifies that the session is created and GET request works as expected.
    [Tags]    regression    smoke    post    140
    # Create a session with the base URL and headers. The session will be used for subsequent requests
    Create Session    shopsession    ${BASE_URL}    headers=${HEADERS}    verify=True
    # Create a dictionary with the product data to be sent in the POST request.
    ${prod_name} =    Generate Random String    10    [a-zA-Z0-9]
    ${PAYLOAD} =    Create Dictionary    name=${prod_name}    price=199
    ${PAYLOAD} =    Create Dictionary    name=${prod_name}    price=199    productType=laptops    quantity=299
    ${response}=      POST On Session  shopsession    /products    json=${PAYLOAD}    expected_status=any
    Should Be Equal As Integers    ${response.status_code}    201
    Log    ${response.json()}
Retrieve product data - GET product -using 'Cypress API testing API'
    [Documentation]    This test uses the API used for 'Cypress API testing'. This test verifies that the session is created and GET request works as expected.
    [Tags]    regression    smoke    get    135
    Create Session    mysession    ${BASE_URL}    headers=${HEADERS}
    ${response}=      GET On Session  mysession    /products    expected_status=any
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}
Get response with a simple GET request
    [Documentation]    This test verifies that the GET request works as expected.
    [Tags]    regression    smoke    136
    Create Session    my_api    https://jsonplaceholder.typicode.com
    ${resp} =    GET On Session   my_api    /posts/10
    #${resp} =    GET    htps://jsonplaceholder.typicode.com/posts/10
    #difference between GET On Session and GET is that the former uses a session created with Create Session, while the latter does not use a session.
    #'GET Request' is deprecated.
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    Response: ${resp.json()}
    Log    Response Body: ${resp.text}
    Log    Response Headers: ${resp.headers}
    ${json_data} =    Set variable     ${resp.json()}
    #${json_data} =    Evaluate       json.loads('${resp.text}');
    #above one returning error because the response is not a valid JSON string.
    Should Be Equal As Strings    ${json_data['id']}    10

POST response with a simple POST request
    [Documentation]    This test verifies that the POST request works as expected.
    [Tags]    regression    smoke    137
    Create Session    my_api    https://jsonplaceholder.typicode.com
    ${data} =    Create Dictionary    title=foo    body=bar    userId=1
    ${resp} =    POST On Session   my_api    /posts    json=${data}
    Should Be Equal As Strings    ${resp.status_code}    201
    Log    Response: ${resp.json()}
    Log    Response Body: ${resp.text}


