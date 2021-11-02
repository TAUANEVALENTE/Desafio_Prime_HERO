*** Settings ***
Documentation        Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito
...                  a automação mobile.
Library              AppiumLibrary

*** Variables ***
## variaveis do aplicativo
${BTN_LOGIN}             accessibility_id=Account
${BTN_SINGIN}            button 
${BTN_ADD}               accessibility_id=Add account
${INSERT_EMAIL}          xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
${BTN_NEXT}              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${INSERT_PSW}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText
${password}              #DIGITE SUA SENHA AQUI         
# ${BTN_IM}                xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View/android.widget.Button
${BTN_IGREE}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[4]/android.view.View/android.widget.Button
${BTN_MORE}              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${BTN_ACCEPT}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.Button
${CLICK_EXPLORER}        accessibility_id=Explore
${BTN_CLICKV}            xpath=//android.view.ViewGroup[@content-desc="Eating Extreme Hot Wings... - 13 minutes, 26 seconds - Go to channel - Tom Simons - 1.9M views - 1 day ago - play video"]/android.view.ViewGroup      

*** Keywords ***
Abrir aplicativo
    Set Appium Timeout                60
    Open Application                  http://localhost:4723/wd/hub
    ...                               automationName=UiAutomator2
    ...                               platformName=Android
    ...                               platformVersion=11.0
    ...                               deviceName=pixel
    ...                               autoGrantPermissions=true
    ...                               appPackage=com.google.android.youtube
    ...                               appActivity=com.google.android.apps.youtube.app.WatchWhileActivity

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible                id=youtube_logo  
    Element Attribute Should Match               xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView           selected        True



Logar no aplicativo com a conta "${email}" 
    
    Wait Until Element Is Visible       ${BTN_LOGIN}   20     
    Click Element                       ${BTN_LOGIN}           
    
    Wait Until Element Is Visible      ${BTN_SINGIN}  25
    Click Element                      ${BTN_SINGIN}

    Wait Until Element Is Visible       ${BTN_ADD}     20
    Click Element                       ${BTN_ADD}  

    Wait Until Element Is Visible       ${INSERT_EMAIL}       20
    Input Text                          ${INSERT_EMAIL}       ${email}       

    Wait Until Element Is Visible       ${BTN_NEXT}        20
    Click Element                       ${BTN_NEXT}      

    Wait Until Element Is Visible       ${INSERT_PSW}      20
    Input Text                          ${INSERT_PSW}      ${password}
    Press Keycode                       66
    
    # Swipe    579    1672    561    289
    # Wait Until Element Is Visible      ${BTN_IM}       20
    # click Element                      ${BTN_IM}

    Wait Until Element Is Visible      ${BTN_IGREE}        20
    click Element                      ${BTN_IGREE} 

    Wait Until Element Is Visible      ${BTN_MORE}         20
    click Element                      ${BTN_MORE}

    Wait Until Element Is Visible      ${BTN_ACCEPT}      20
    click Element                      ${BTN_ACCEPT} 


Entrar no menu “Explorar”

    Wait Until Element Is Visible      ${CLICK_EXPLORER}       20
    Click Element                      ${CLICK_EXPLORER}


Usar swipe de tela até o 10 item da tela  
    Swipe    461    1629    549    250
    Swipe    457    1585    575    119
    Swipe    360    1629    500    101
    Swipe    228    1523    505    285
    Swipe    462    1429    512    561
    Swipe    499    1579    450    610
    Swipe    574    1602    579    297
    
Clicar no vídeo
    
    Wait Until Element Is Visible    ${BTN_CLICKV}
    Click Element                    ${BTN_CLICKV}
    
Fechar aplicativo
    Close Application 


# # id=com.google.android.youtube:id/mobile_topbar_avatar
# Click Element    id=com.google.android.youtube:id/mobile_topbar_avatar
# # id=com.google.android.youtube:id/button
# Click Element    id=com.google.android.youtube:id/button
# # accessibility id=Adicionar conta
# Click Element    accessibility id=Adicionar conta
# # xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
# Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText    vinicius.beta@gmail.com


# Swipe    341    1473    364    798
# Swipe    349    1364    506    127
# Swipe    563    1418    576    450
# Swipe    618    1341    537    323
# Swipe    597    1604    493    736
# Swipe    625    1566    563    618
# # xpath=//android.view.ViewGroup[@content-desc="What Your Early Twenties Will Be Like - 8 minutes, 55 seconds - Go to channel - TheOdd1sOut - 4M views - 2 days ago - play video"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]
# Click Element    xpath=//android.view.ViewGroup[@content-desc="What Your Early Twenties Will Be Like - 8 minutes, 55 seconds - Go to channel - TheOdd1sOut - 4M views - 2 days ago - play video"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]
# Go Back
# accessibility id=Explore
# Click Element    accessibility id=Explore

# Swipe    563    1648    496    269
# Swipe    576    1488    540    209
# Swipe    509    1333    524    114
# Swipe    434    1527    434    1064
# # xpath=//android.view.ViewGroup[@content-desc="Eating Extreme Hot Wings... - 13 minutes, 26 seconds - Go to channel - Tom Simons - 1.9M views - 1 day ago - play video"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]
# Click Element    xpath=//android.view.ViewGroup[@content-desc="Eating Extreme Hot Wings... - 13 minutes, 26 seconds - Go to channel - Tom Simons - 1.9M views - 1 day ago - play video"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]

# Swipe    593    1778    577    940
# Swipe    382    1604    143    577
# Swipe    450    1781    680    614
# Swipe    484    1362    528    472
# Swipe    661    934    245    282
# Swipe    472    1784    512    1033
# Swipe    403    1279    422    732

# # xpath=//android.view.ViewGroup[@content-desc="Eating Extreme Hot Wings... - 13 minutes, 26 seconds - Go to channel - Tom Simons - 1.9M views - 1 day ago - play video"]/android.view.ViewGroup
# Click Element    xpath=//android.view.ViewGroup[@content-desc="Eating Extreme Hot Wings... - 13 minutes, 26 seconds - Go to channel - Tom Simons - 1.9M views - 1 day ago - play video"]/android.view.ViewGroup

# Swipe    386    1651    426    593
# Swipe    514    1580    549    224
# Swipe    588    1580    580    180
# Swipe    386    1602    470    127
# # xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.View
# Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.View

# Swipe    500    1594    560    233
# Swipe    404    1597    512    88
# Swipe    489    1648    523    213
# Swipe    438    1643    537    88
# Swipe    361    1577    483    256
