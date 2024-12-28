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
    ${title}=    Get Title    ==    Front - ServeRest
    Log    ${title}

Fill User Data And Register
    Click    css=.btn-link
    ${EMAIL}=    FakerLibrary.Email
    Fill Text    css=input[data-testid='nome']    txt=Vitor Calado
    Fill Text    css=input[data-testid='email']    txt=${EMAIL}
    Fill Text    css=input[data-testid='password']    txt=test1234
    Check Checkbox    css=input[data-testid='checkbox']
    # Click    css=button[data-testid='cadastrar']
    Click    xpath=//*[@id="root"]//button >> text="Cadastrar"

Check User Registered Successfully
    # Wait For Elements State    h1    visible
    Get Text    css=h1    ==    Bem Vindo Vitor Calado
    Get Element States    css=button[data-testid='logout']    validate    value & visible
