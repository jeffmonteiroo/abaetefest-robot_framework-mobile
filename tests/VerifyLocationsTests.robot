*** Settings ***
Documentation           Este arquivo contém testes para verificar a ação de busca por categoria ao listar os locais no Abaetefest.
Resource                ../resources/common_resources.robot
Resource                ../resources/element_locators.robot

Test Setup              Setup for Platform
Test Teardown           Teardown for Platform

*** Keywords ***



*** Test Cases ***
CT01 - Listar locais por categoria: Artigos de Pesca Esportiva
    [Documentation]                 Este teste valida se é exibida corretamente a listagem de locais pela categoria "Artigos de Pesca Esportiva".
    Abra o menu
    Clique em                             Locais
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Artigos de Pesca Esportiva
    Clique No Primeiro Card
    #Verificar Nome do Estabelecimento
    #Validar Telefone
    #Validar Endereço
    #Verificar o botão          solicitar uber
    
CT02 - Listar local por categoria: Churrascarias/Espetarias 
    [Documentation]                  Este teste valida se é exibida corretamente a listagem de locais pela categoria "Churrascarias/Espetarias".
    Abra o menu
    Clique em                             Locais
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Churrascarias/Espetarias 
    #Clique No Primeiro Card
    #Verificar Nome do Estabelecimento
    #Validar Telefone
    #Validar Endereço
    #Verificar o botão          solicitar uber

CT03 - Listar local por categoria: Farmácias
    [Documentation]                  Este teste valida se é exibida corretamente a listagem de locais pela categoria "Farmácias".
    Abra o menu
    Clique em                             Locais
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Farmácias
    #Clique No Primeiro Card
    #Verificar Nome do Estabelecimento
    #Validar Telefone
    #Validar Endereço
    #Verificar o botão          solicitar uber

CT04 - Listar local por categoria: Açaí
    [Documentation]                   Este teste valida se é exibida corretamente a listagem de locais pela categoria "Açaí".
    Abra o menu
    Clique em                             Locais
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Açai 
    #Clique No Primeiro Card
    #Verificar Nome do Estabelecimento
    #Validar Endereço
    #Verificar o botão          solicitar uber

CT05 - Visualizar mapa por categoria: Bancos
    [Documentation]                   Este teste valida se é exibida corretamente a listagem de locais pela categoria "Bancos".
    Abra o menu
    Clique em                             Locais
    Entre na funcionalidade               Mapa
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Bancos
    #Que contenha o ícone                

CT06 - Visualizar mapa por categoria: Hotéis
    [Documentation]                   Este teste valida se é exibida corretamente a listagem de locais pela categoria "Hotéis".
    Abra o menu
    Clique em                             Locais
    Entre na funcionalidade               Mapa
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Hotéis

CT07 - Visualizar mapa por categoria: Hospitais e Postos de Saúde
    [Documentation]                   Este teste valida se é exibida corretamente a listagem de locais pela categoria "Hospitais e Postos de Saúde".
    Abra o menu
    Clique em                             Locais
    Entre na funcionalidade               Mapa
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Hospitais e Postos de Saúde

CT08 - Visualizar mapa por categoria: Pub & Restaurante
    [Documentation]                   Este teste valida se é exibida corretamente a listagem de locais pela categoria "Pub & Restaurante".
    Abra o menu
    Clique em                             Locais
    Entre na funcionalidade               Mapa
    Selecionar Categoria no Menu          Selecione uma categoria
    Selecionar categoria                  Pub & Restaurante

