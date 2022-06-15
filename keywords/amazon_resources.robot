*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${BROWSER}                 chrome 
${URL}                     http://www.amazon.com.br
${MENU_OFERTAS_DO_DIA}       //a[@href='/deals?ref_=nav_cs_gb'][contains(.,'Ofertas do Dia')]
${HEADER_OFERTAS_DO_DIA}     //h1[@class='a-size-extra-large a-spacing-micro'][contains(.,'Ofertas e Promoções')]
${BTN_ADD_CARRINHO}         //input[contains(@name,'submit.add-to-cart')]
${ADICIONADO_NO_CARRINHO}  //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CARRINHO}                nav-cart
${QUANTIDADE_ITENS_BOTÃO}    a-autoid-0-announce
${QUANTIDADE_ITENS}        //option[@value='2'][contains(.,'2')]
${SUBTOTAL_ITENS}            sc-subtotal-label-activecart
${EXCLUIR}                 //input[contains(@value,'Excluir')]
${REMOVIDO_DO_CARRINHO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_OFERTAS_DO_DIA}

Entrar no menu "Ofertas do Dia"
    Click Element    locator=${MENU_OFERTAS_DO_DIA}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_OFERTAS_DO_DIA} 
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
        
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[text()="${NOME_CATEGORIA}"]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
    
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Image    locator=//img[@src='https://m.media-amazon.com/images/I/713ufrm1hvL._AC_UL320_.jpg']
    Wait Until Element Is Visible    locator=${BTN_ADD_CARRINHO}
    Click Button    locator=${BTN_ADD_CARRINHO}

    
Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${ADICIONADO_NO_CARRINHO}
    Click Link                       locator=${CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]
    
Alterar a quantidade do produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    locator=${QUANTIDADE_ITENS_BOTÃO} 
    Click Element                    locator=${QUANTIDADE_ITENS_BOTÃO} 
    Wait Until Element Is Visible    locator=${QUANTIDADE_ITENS}
    Click Element                    locator=${QUANTIDADE_ITENS}
    Sleep    2

Verificar subtotal de itens do carrinho
        Wait Until Element Is Visible    locator=${SUBTOTAL_ITENS}
     

Remover o produto "${PRODUTO}" do carrinho 
    Click Element   locator=${EXCLUIR}

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${REMOVIDO_DO_CARRINHO}

# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Ofertas do Dia"
    Entrar no menu "Ofertas do Dia"

Então o título da página deve ficar "Ofertas e Promoções | Amazon.com.br"
    Verificar se o título da página fica "Ofertas e Promoções | Amazon.com.br"

E o texto "Ofertas e Promoções" deve ser exibido na página
    Verificar se aparece a frase "Ofertas e Promoções"

E a categoria "Informática" deve ser exibida na página
    Verificar se aparece a categoria "Informática"

Quando pesquisar pelo produto "Xbox Series S – Pacote Fortnite e Rocket League"
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S – Pacote Fortnite e Rocket League"
    Verificar se o título da página fica "Amazon.com.br :Xbox Series S – Pacote Fortnite e Rocket League"

E um produto da linha "Xbox Series S – Pacote Fortnite e Rocket League" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S – Pacote Fortnite e Rocket League"

Quando adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S – Pacote Fortnite e Rocket League"
    Adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho

Então o produto "Xbox Series S – Pacote Fortnite e Rocket League" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series S – Pacote Fortnite e Rocket League" foi adicionado com sucesso

E existe o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Quando adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Então o produto "Xbox Series S – Pacote Fortnite e Rocket League" deve ser mostrado no carrinho

Quando alterar a quantidade do produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Alterar a quantidade do produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho

Então a quantidade de itens do carrinho será aumentada
    Verificar subtotal de itens do carrinho
    
Quando remover o produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Remover o produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio