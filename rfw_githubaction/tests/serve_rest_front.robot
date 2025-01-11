*** Settings ***
Resource         ../resources/serve-rest-front.resource
Suite Teardown   Close Browser    ALL


*** Test Cases ***
Login with success
    Open Browser
    Go To Serve Rest Page
    Fill User Data And Register
    Check User Registered Successfully


Chalange: Check is the new user is show in user list
    Register new user
    Access the user list
    Check if the new user is in the list