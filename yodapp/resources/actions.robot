***Settings***
Documentation       Ações customizadas do yodapp
Library             Browser
Resource                ../resources/base.robot
***Keywords***

Go To Home Page 
    Go To           ${BASE_URL} 
    Wait For Elements State     //div[@class='carousel']            visible         5s 

Go To User Form 
    # Dado que acesso o formulário
    Click                       //strong[contains(.,'Novo')]
    # Checkpoint
    Wait For Elements State     //p[@class='card-header-title'][contains(.,'Cadastrar novo usuário')]
    ...                         visible             5s

Fill User Form
    [Arguments]                 ${user}
    Fill Text                   //input[@name='nome']              ${user}[name]
    Fill Text                   //input[@name='email']             ${user}[email]
    Select Options By           css=.ordem select       text       ${user}[ordem]
    
    Select Birth Date           ${user}[bdate]
    Fill Text                   //input[@name='instagram']         ${user}[instagram]

Select Jedi
    [Arguments]                 ${user} 
    Click                       //input[@value="${user}[tpjedi]"]/..//span[@class="check"]
    
Check Accept Communications
    Click                       //input[@name='comunications']/..//span[@class="check"]

Submit User Form
    # E submeto o formulário
    Click                       //button[contains(.,'Cadastrar')]

Toaster Message Should Be 
    [Arguments]                 ${expected_message}
    Wait For Elements State     css=.toast div          visible             5s
    Get Text                    css=.toast div          equal               ${expected_message}

User Should Be visible
    [Arguments]                 ${user}
    Wait For Elements State     //td[contains(text(), "${user}[email]")]/..    
    ...                         visible                 5s