*** Settings ***
Documentation            Aqui estão presentes os testes mobile do curso Prime Hero.
...                      Para criar verificação de automação mobile
Resource             ../resource/mob_resource.robot
Test Setup           Abrir aplicativo
Test Teardown        Fechar aplicativo


*** Test Cases ***

Caso de Teste 02: Logar no YouTube
    Dado que o cliente esteja na tela de Home
    # Logar no aplicativo com a conta "DIGITE SEU E-MAIL AQUI"
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    # Clicar no vídeo 

# Caso de Teste 03: Usar método Swipe na tela
#     Abrir App
#     Entrar no menu “Explorar”
#     Usar swipe de tela até o 10 item da tela
#     Clicar no vídeo