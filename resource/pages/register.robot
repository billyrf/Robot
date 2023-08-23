*** Settings ***
Resource    ../main.robot


*** Variables ***
${URL}              http://localhost:3000/
${FIELD_NAME}       id:form-nome
${FIELD_OFFICE}     id:form-cargo
${FIELD_IMAGE}      id:form-imagem
${FIELD_TEAM}       class:lista-suspensa
${BOTAO_CARD}       id:form-botao
${PLEASE_FILL_NAME}         id:form-nome-erro
${PLEASE_FILL_OFFICE}       id:form-cargo-erro
${PLEASE_SELECT_TEAM}       id:form-times-erro
@{SELECT_TEAM}
...                 //option[contains(.,'Programação')]
...                 //option[contains(.,'Front-End')]
...                 //option[contains(.,'Data Science')]
...                 //option[contains(.,'Devops')]
...                 //option[contains(.,'UX e Design')]
...                 //option[contains(.,'Mobile')]
...                 //option[contains(.,'Inovação e Gestão')]


*** Keywords ***
Given user fill the fields
    ${NAME}    FakerLibrary.First Name
    Input Text    ${FIELD_NAME}    ${NAME}
    ${JOB}    FakerLibrary.Job
    Input Text    ${FIELD_OFFICE}    ${JOB}
    ${IMAGE}    FakerLibrary.Image Url
    Input Text    ${FIELD_IMAGE}    ${IMAGE}
    Click Element    ${FIELD_TEAM}
    Click Element    ${SELECT_TEAM}[0]

And click on 'Criar card' Button
    Sleep    10s
    Click Button    ${BOTAO_CARD}

Then create card
    Element Should Be Visible    class:colaborador
    Sleep    5s

Given button is clicked
    Sleep    5s
    Click Button    ${BOTAO_CARD}
    Sleep    5s

Then errors must be appear
    Element Should Be Visible    ${PLEASE_FILL_NAME}
    Element Should Be Visible    ${PLEASE_FILL_OFFICE}
    Element Should Be Visible    ${PLEASE_SELECT_TEAM}
