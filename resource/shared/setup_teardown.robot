*** Settings ***
Resource    ../main.robot


*** Variables ***
${URL}      http://localhost:3000/


*** Keywords ***
Given organo is accessed
    Open Browser    ${URL}    browser=Chrome

Close organo
    Close Browser
