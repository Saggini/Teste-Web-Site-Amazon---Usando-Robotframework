*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Ofertas do Dia"
    [Documentation]    Esse teste verifica o menu Ofertas do Dia do site da Amazon.com.br
    ...                e verifica a categoria Informática
    [Tags]             menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Ofertas do Dia"
    Então o título da página deve ficar "Ofertas e Promoções | Amazon.com.br"
    E o texto "Ofertas e Promoções" deve ser exibido na página
    E a categoria "Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S – Pacote Fortnite e Rocket League"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S – Pacote Fortnite e Rocket League"
    E um produto da linha "Xbox Series S – Pacote Fortnite e Rocket League" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Então o produto "Xbox Series S – Pacote Fortnite e Rocket League" deve ser mostrado no carrinho

Caso de Teste 04 - Alterar Quantidade do Produto no Carrinho
    [Documentation]    Esse teste aumenta a quantidadede de um produto no carrinho de compras
    [Tags]             alterar_quantidade
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Quando alterar a quantidade do produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Então a quantidade de itens do carrinho será aumentada

Caso de Teste 05 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
    Quando remover o produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Então o carrinho deve ficar vazio