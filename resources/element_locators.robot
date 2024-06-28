*** Variables ***
${SEARCH}                               xpath=//input[@aria-label='Pesquise']
${DOWN-2}                               xpath=(//div[@class='text-h6'])[2]
${DOWN}                                 xpath=//div[contains(@class,'q-card')]//div[contains(@class,'text-h6')]
${WHATSAPP_LINK}                        https://api.whatsapp.com/send?phone=5591982828945&text=Ol%C3%A1%2C%20gostaria%20de%20saber%20como%20publicar%20meu%20evento%20no%20app%20Abaet%C3%A9Fest
${INSTAGRAM_LINK}                       https://www.instagram.com/abaetefest/
${ABAETETECH_LINK}                      https://abaetetech.com.br/

${XPATH_TEXT_BOLD}                      //span[@class='text-bold']
${TEXT}                                 ${LAST_EVENT}
${element_title}                        xpath=.//div[contains(@class, 'q-card__section--vert')]//div[contains(@class, 'text-h6')]
${element_date}                         xpath=.//div[contains(@class, 'q-card__section--vert')]//span[contains(@class, 'text-caption text-grey')]
${element_list}                         xpath=//div[contains(@class, 'q-table__grid-content')]//div[contains(@class, 'q-pa-sm col-xs-12 col-sm-6 col-md-3')]
${TIMEOUT}                              10s

*** Keywords *** 
Selecionar Categoria no Menu
    [Arguments]                       ${TEXT}
    ${LOCATOR}                        Set Variable    //input[@aria-label='${TEXT}']
    Sleep                             5           
    Page Should Contain Element       ${LOCATOR}                   ${TIMEOUT}
    Click Element                     ${LOCATOR}                  

Selecionar categoria
    [Arguments]                      ${TEXT}
    ${CATEGORY}=                     Set Variable                //div[contains(@class,'q-item__label') and text()='${TEXT}']
    Wait Until Element Is Visible    ${CATEGORY}                 ${TIMEOUT}
    Click Element                    ${CATEGORY}                 
    Sleep                            3           
    #Scroll Element Into View         ${DOWN}  

Pesquisar por
    [Arguments]                      ${TEXT}
    Input Text                       ${SEARCH}                    ${TEXT}
    Wait Until Page Contains         ${TEXT}                      ${TIMEOUT}
    Scroll Element Into View         ${DOWN}   

Abra o menu
    Wait Until Element Is Visible    xpath=//button[@aria-label='Menu']    ${TIMEOUT}
    Click Element                    xpath=//button[@aria-label='Menu']

Clique em
    [Arguments]                         ${TEXT}    
    Wait Until Page Contains Element    xpath=//*[contains(@class, 'q-item__label') and contains(text(), '${TEXT}')]    ${TIMEOUT}
    Click Element                       xpath=//*[contains(@class, 'q-item__label') and contains(text(), '${TEXT}')]
    Wait Until Page Contains            ${TEXT}                    ${TIMEOUT}

Deve conter o texto
    [Arguments]                         ${TEXT}
    Page Should Contain Text            ${TEXT}                    ${TIMEOUT}

Verificar o botão
    [Arguments]                         ${TEXT}
    Page Should Contain Text            ${TEXT}                    ${TIMEOUT}

Validar Link WhatsApp
    ${LOCATOR} =    Set Variable        //a[contains(@href, '${WHATSAPP_LINK}')]
    Page Should Contain Element         ${LOCATOR}                 ${TIMEOUT}

Validar Link Instagram
    ${LOCATOR} =    Set Variable        //a[contains(@href, '${INSTAGRAM_LINK}')]
    Page Should Contain Element         ${LOCATOR}                 ${TIMEOUT} 

Validar Link Abaetetech
    ${LOCATOR} =    Set Variable        //a[contains(@href, '${ABAETETECH_LINK}')]
    Page Should Contain Element         ${LOCATOR}                 ${TIMEOUT}


Clique No Primeiro Card
    Sleep     4
    Wait Until Page Contains Element       xpath=//div[contains(@class, 'row justify-between')]       ${TIMEOUT}
    @{elements}=    Get WebElements        xpath=//div[contains(@class, 'q-item__label text-bold text-primary text-blue-2')]
    Log    Total de elementos encontrados: ${len(@{elements})}
    Run Keyword If    ${len(@{elements})} == 0    Fail    Não foram encontrados elementos com o XPath especificado.
    ${element}=     Set Variable    ${elements[0]}
    Wait Until Element Is Visible         ${element}    ${TIMEOUT}
    Scroll Element Into View           ${element}
    Click Element                      ${element}


    #Sleep         3

Verificar Nome do Estabelecimento
    Wait Until Page Contains Element     xpath=(//div[@class='q-toolbar row no-wrap items-center'])[2]    timeout=10s
    ${element}=                          Get WebElement        xpath=(//div[@class='q-toolbar row no-wrap items-center'])[2]/div
    ${text}=                             Get Text              ${element}
    Log    ${text}
    Page Should Contain Text   ${text}

Validar Telefone
    ${XPATH_TELEFONE}         Set Variable      xpath=//p[span[@class='text-bold']]
    ${elemento_paragrafo}=    Get Webelement    ${XPATH_TELEFONE}
    ${telefone}=              Get Text          ${elemento_paragrafo}
    Log                       ${telefone}    

Validar Endereço
    ${XPATH_ENDEREco}         Set Variable      xpath=//p[strong[contains(text(), 'Endereço:')]]
    ${elemento_endereco}=     Get Webelement    ${XPATH_ENDERECO}
    ${texto_endereco}=        Get Text    ${elemento_endereco}
    Log                       ${texto_endereco}

Validar Mapa Exibido
    ${xpath}    Set Variable             //div[@class='q-pt-none q-card__section q-card__section--vert']/p[contains(text(), 'Veja no mapa')]
    Element Should Be Visible            xpath=${xpath}

Entre na funcionalidade
   [Arguments]                           ${TEXT}
    Wait Until Element Is Visible        xpath=//span[@class="block" and text()='${TEXT}']            
    Sleep                                3
    Click Element                        xpath=//span[@class="block" and text()='${TEXT}']

#Que contenha o ícone
#    ${xpath}        Set Variable         //div[@class='leaflet-pane leaflet-marker-pane']//img[contains(@src, 'bank.png')]
#    ${elements}     Get WebElements      ${xpath}
#    ${first_element}    Set Variable     ${elements}[0]
#    Wait Until Element Is Visible        ${first_element}    timeout=10s
#    Page Should Contain Element          ${first_element}           

Pesquisar pelo nome do último item
    ${events}=    Create List
    ${cards}=    Get WebElements         ${element_list} 
    FOR     ${card}                IN                @{cards}
            ${title_element}=      Get WebElement    ${element_title} 
            ${date_element}=       Get WebElement    ${element_date} 
            ${title}=              Get Text          ${title_element}
            ${date}=               Get Text          ${date_element}
            ${event}=              Set Variable      ${title} - ${date}
            Append To List         ${events}         ${event}
    END
    Log Many                              ${events}
    ${last_event}=                 Get From List     ${events}    -1
    ${last_event_name}=            Remove String     ${last_event}    ${last_event[-21:]}    # Remove os últimos 21 caracteres
    Log    Último evento capturado: ${last_event_name}
    Set Suite Variable              ${LAST_EVENT}      ${last_event_name}

    Input Text                     ${SEARCH}         ${last_event}
    Wait Until Page Contains       ${last_event}     ${TIMEOUT}
    Scroll Element Into View       ${DOWN}