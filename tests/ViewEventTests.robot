*** Settings ***
Resource                ../resources/common_resources.robot
Resource                ../resources/element_locators.robot

Test Setup              Setup for Platform
Test Teardown           Teardown for Platform

*** Test Cases ***

CT1 - Visualizar eventos por categoria: Todos
    Clique para selecionar     Selecione uma categoria
    Selecionar categoria       Todas    

CT2 - Visualizar eventos por categoria: Festas
    Clique para selecionar     Selecione uma categoria
    Selecionar categoria       Festas

CT3 - Visualizar eventos por categoria: Cultural
    Clique para selecionar     Selecione uma categoria
    Selecionar categoria       Cultural

CT4 - Visualizar eventos por categoria: Esportivo
    Clique para selecionar     Selecione uma categoria
    Selecionar Categoria       Esportivos

CT5 - Visualizar eventos por categoria: Turismo
    Clique para selecionar     Selecione uma categoria
    Selecionar categoria       Turismo

CT6 - Pesquisar evento pelo nome
    Pesquisar por               Concurso Garota Carro do Lixo

CT7 - Pesquisar pelo nome o último evento da lista
    Pesquisar pelo nome do último item
    #Consulta o último evento da lista