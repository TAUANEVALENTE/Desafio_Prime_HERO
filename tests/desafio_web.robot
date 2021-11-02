*** Settings ***
Documentation            Aqui estão presentes os testes web do curso Prime Hero.
...                      Para criar verificação de automação web
Resource                 ../resource/web_resource.robot
Test Setup               Abrir Navegador
Test Teardown            Fechar Navegador  


*** Test Cases ***
Caso de Teste 01:Pesquisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão Pesquisar 
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente   
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão Pesquisar 
    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03:Listar Produtos
     Acessar a página home do site Automation Practice
     Passar o mouse por cima da categoria "Women" no meu principal superior de categorias
     Clicar na sub categoria "Summer Dresses"
     Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso