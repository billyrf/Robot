*** Settings ***
Resource            ../resource/main.robot

Test Setup          Given organo is accessed
Test Teardown       Close organo


*** Variables ***
${BUTTON}                   id:form-botao
${PLEASE_FILL_NAME}         id:form-nome-erro
${PLEASE_FILL_OFFICE}       id:form-cargo-erro
${PLEASE_SELECT_TEAM}       id:form-times-erro


*** Test Cases ***
Check error when fields is not filled
    Given button is clicked
    Then errors must be appear
