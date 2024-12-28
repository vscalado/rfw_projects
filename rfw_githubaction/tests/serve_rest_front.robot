*** Settings ***
Resource    ../resources/serve-rest-front.resource


*** Test Cases ***
Login with success
    Open Browser
    Go To Serve Rest Page
    Fill User Data And Register
    Check User Registered Successfully
