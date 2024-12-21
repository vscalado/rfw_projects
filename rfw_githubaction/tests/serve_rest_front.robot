*** Settings ***
Resource    ../resources/serve-rest-front.resource


*** Test Cases ***
Login with success
    Open Browser
    Go To Serve Rest Page
    ${NAME_RESULT}    Fill User Data And Register
    Check If User Is Loged    NAME=${NAME_RESULT}
