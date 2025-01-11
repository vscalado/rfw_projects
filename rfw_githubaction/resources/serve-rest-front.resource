*** Settings ***
Library     Browser
Library     FakerLibrary


*** Variables ***
${BROWSER}              chromium
${HEADLESS}             ${False}
${URL_SERVE_REST}       https://front.serverest.dev/login
${EMAIL}    ${None}


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
    Set Suite Variable    ${EMAIL}
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

Register new user
    Open Browser
    Go To Serve Rest Page
    Fill User Data And Register
    Sleep    5s


Access the user list
    Click    css=[data-testid="listarUsuarios"]
    Get Text    css=h1    ==    Lista dos usuários
    Sleep    5s

Check if the new user is in the list
    ${ELEMENT}    Get Element By    selection_strategy=text    text=${EMAIL}
    Get Text    ${ELEMENT}    ==    ${EMAIL}
    Highlight Elements    ${ELEMENT}
    Take Screenshot       fullPage=${true} 