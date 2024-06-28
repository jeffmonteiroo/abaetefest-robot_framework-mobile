*** Settings ***
Documentation           Este arquivo contém testes para verificar os dados de contato do Abaetefest.
Resource                ../resources/common_resources.robot
Resource                ../resources/element_locators.robot

Test Setup              Setup for Platform
Test Teardown           Teardown for Platform

*** Test Cases ***

CT01 - Verificar dados de contato
    [Documentation]        Este teste verifica se os dados de contato são exibidas corretamente.
    Abra o menu
    Clique em              Contato
    Deve conter o texto    Você gostaria de ver o seu evento no nosso app? Envie as informações para nosso whatsapp ou instagram:
    Verificar o botão      Whatsapp
    Verificar o botão      instagram
    Deve conter o texto    abaetetech.com.br
    Validar Link WhatsApp
    Validar Link Instagram
    Validar Link Abaetetech