*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Ofertas do Dia""
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Ofertas do Dia"
    Verificar se aparece a frase "Ofertas e Promoções"
    Verificar se o título da página fica "Ofertas e Promoções | Amazon.com.br"
    Verificar se aparece a categoria "Informática"
    Verificar se aparece a categoria "Eletrônicos"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S – Pacote Fortnite e Rocket League"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S – Pacote Fortnite e Rocket League"
	Adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
	Verificar se o produto "Xbox Series S – Pacote Fortnite e Rocket League" foi adicionado com sucesso
  
    
Caso de Teste 04 - Alterar Quantidade do Produto no Carrinho
    [Documentation]    Esse teste aumenta a quantidadede de um produto no carrinho de compras
    [Tags]             alterar_quantidade
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S – Pacote Fortnite e Rocket League"
	Adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
	Verificar se o produto "Xbox Series S – Pacote Fortnite e Rocket League" foi adicionado com sucesso
    Alterar a quantidade do produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Verificar subtotal de itens do carrinho

Caso de Teste 05 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S – Pacote Fortnite e Rocket League" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
	Adicionar o produto "Xbox Series S – Pacote Fortnite e Rocket League" no carrinho
	Verificar se o produto "Xbox Series S – Pacote Fortnite e Rocket League" foi adicionado com sucesso
    Remover o produto "Xbox Series S – Pacote Fortnite e Rocket League" do carrinho
    Verificar se o carrinho fica vazio