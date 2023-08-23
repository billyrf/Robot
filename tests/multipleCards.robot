*** Settings ***
Resource            ../resource/main.robot

Test Setup          Given organo is accessed
Test Teardown       Close organo


*** Variables ***
${URL}              http://localhost:3000/
${FIELD_NAME}       id:form-nome
${FIELD_OFFICE}     id:form-cargo
${FIELD_IMAGE}      id:form-imagem
${FIELD_TEAM}       class:lista-suspensa
${BOTAO_CARD}       id:form-botao
@{SELECT_TEAM}
...                 //option[contains(.,'Programação')]
...                 //option[contains(.,'Front-End')]
...                 //option[contains(.,'Data Science')]
...                 //option[contains(.,'Devops')]
...                 //option[contains(.,'UX e Design')]
...                 //option[contains(.,'Mobile')]
...                 //option[contains(.,'Inovação e Gestão')]


*** Test Cases ***
Create multiple cards on website with different teams
    FOR    ${i}    ${TEAM}    IN ENUMERATE    @{SELECT_TEAM}
        ${NAME}    FakerLibrary.First Name
        Input Text    ${FIELD_NAME}    ${NAME}
        ${JOB}    FakerLibrary.Job
        Input Text    ${FIELD_OFFICE}    ${JOB}
        ${IMAGE}    FakerLibrary.Image Url    width=100    height=100
        Input Text    ${FIELD_IMAGE}    ${IMAGE}
        Click Element    ${TEAM}
        Sleep    10s
        Click Button    ${BOTAO_CARD}
        Element Should Be Visible    class:colaborador
        Sleep    5s
    END
