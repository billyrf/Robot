*** Settings ***
Resource            ../resource/main.robot

Test Setup          Given organo is accessed
Test Teardown       Close organo


*** Variables ***
${URL}                      http://localhost:3000/
${FIELD_NAME}               id:form-nome
${FIELD_OFFICE}             id:form-cargo
${FIELD_IMAGE}              id:form-imagem
${FIELD_TEAM}               class:lista-suspensa
${BOTAO_CARD}               id:form-botao
${OPTION_PROGRAMACAO}       //option[contains(.,'Programação')]
${OPTION_FRONT}             //option[contains(.,'Front-End')]
${OPTION_DADOS}             //option[contains(.,'Data Science')]
${OPTION_DEVOPS}            //option[contains(.,'Devops')]
${OPTION_UX}                //option[contains(.,'UX e Design')]
${OPTION_MOBILE}            //option[contains(.,'Mobile')]
${OPTION_INOVACAO}          //option[contains(.,'Inovação e Gestão')]


*** Test Cases ***
# Open navigator and access organo website (Without keyword)
#    Open Browser    url=http://localhost:3000/    browser=Chrome

# Fill fields on the organo website (without keywords)
#    Input Text    id:form-nome    Billy
#    Input Text    id:form-cargo    Test specialist
#    Input Text    id:form-imagem    https://picsum.photos/200/300
#    Click Element    class:lista-suspensa
#    Click Element    //option[contains(.,'Programação')]
#    Sleep    10s
#    Click Button    id:form-botao
#    Element Should Be Visible    class:colaborador
#    Sleep    5s

Check if one card is created
    Given user fill the fields
    And click on 'Criar card' Button
    Then create card

Check if 3 card is created
    FOR    ${i}    IN RANGE    0    3
        Given user fill the fields
        And click on 'Criar card' Button
        Then Then create card
    END
