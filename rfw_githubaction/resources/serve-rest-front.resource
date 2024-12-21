*** Settings ***
Library     Browser
Library     FakerLibrary


*** Variables ***
${BROWSER}              chromium
${HEADLESS}             ${False}
${URL_SERVE_REST}       https://front.serverest.dev/login

*** Keywords ***
Open Browser
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={"width": 1200, "height": 800}

Go To Serve Rest Page
    New Page    url=${URL_SERVE_REST}

Fill User Data And Register
    Click  css=.btn-link
    ${NAME}    FakerLibrary.Firstname
    ${EMAIL}    FakerLibrary.Email
    Fill Text    css=input[data-testid='nome']    txt=${NAME}
    Fill Text    css=input[data-testid='email']    txt=${EMAIL}
    Fill Text    css=input[data-testid='password']    txt=test1234
    Check Checkbox    css=input[data-testid='checkbox']
    Click    css=button[data-testid='cadastrar']
    Sleep  time_=5s
    RETURN    ${NAME}

Check If User Is Loged
    [Arguments]    ${NAME}
    ${welcome}=    Set Variable    Bem Vindo 
    ${TEXT}    Get Text    css=h1
    Should Be Equal    ${TEXT}    ${welcome} ${NAME}
    
    

