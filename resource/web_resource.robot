*** Settings ***
Documentation
Library        SeleniumLibrary   
Library        String

*** Variables ***
${URL}        http://automationpractice.com/index.php
${BROWSER}    chrome

&{PESSOA}              nome=Tauane    sobrenome=Testando   pwd=17283
...                    endereco=Alameda Mata Atlântica    cidade=Dallas
...                    id_estado=43  cep=54320  telefone=77882245

*** Keywords ***
Abrir Navegador
    Open Browser        browser=chrome
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser 

Acessar a página home do site Automation Practice
    Go To                                ${URL} 
    Title Should Be                      My Store    
    Wait Until Element Is Visible        id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                        id=search_query_top    ${PRODUTO}

Clicar no botão Pesquisar 
    Click Element                     xpath=//*[@name='submit_search' and @type='submit']

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible     id=center_column
    Title Should Be                   Search - My Store
    Page Should Contain Image         xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']


Conferir mensagem "${FALHA}"
    Wait Until Element Is Visible    //*[@id="center_column"]/*[@class="alert alert-warning"]
    Element Text Should Be           //*[@id="center_column"]/*[@class="alert alert-warning"]
    ...                              ${FALHA}

Passar o mouse por cima da categoria "${CATEGORIA}" no meu principal superior de categorias
    Wait Until Element Is Visible        //*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                          //*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

Clicar na sub categoria "${SUBCAT}"
    Wait Until Element Is Visible       //*[@id="block_top_menu"]//a[@title="${SUBCAT}"]
    Click Element                      //*[@id="block_top_menu"]//a[@title="${SUBCAT}"]

Conferir se os produtos da sub-categoria "${SUBCAT}" foram mostrados na página
    Wait Until Element Is Visible    //*[@id="center_column"]//span[@class="cat-name"] 

Clicar em "Sign in"
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

Informar um e-mail válido
    Wait Until Element Is Visible   name=email_create
    #Gerar uma palavra aleatória e usar como e-mail
    ${EMAIL}                        Generate Random String
    Input Text                      name=email_create    ${EMAIL}@qarobotmail.com

Clicar em "Create an account"
    Click Button    //button[@class='btn btn-default button button-medium exclusive']

Preencher os dados obrigatórios
    Wait Until Element Is Visible   xpath=//h3[@class="page-subheading" and contains(string(),"Your personal information")]
    Click Element                   id=id_gender2
    Input Text                      id=customer_firstname    ${PESSOA.nome}
    Input Text                      id=customer_lastname     ${PESSOA.sobrenome}
    Input Text                      id=passwd                ${PESSOA.pwd}
    Input Text                      id=address1              ${PESSOA.endereco}
    Input Text                      id=city                  ${PESSOA.cidade}
    Set Focus To Element            id=id_state
    Select From List By Index       id=id_state              ${PESSOA.id_estado}
    Input Text                      id=postcode              ${PESSOA.cep}
    Input Text                      id=phone_mobile          ${PESSOA.telefone}

Submeter cadastro
    Click Button    submitAccount

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    ${PESSOA.nome} ${PESSOA.sobrenome}