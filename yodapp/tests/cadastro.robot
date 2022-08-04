***Settings***
Documentation           Suite de testes do cadastro de personagens

Library                 ../resources/factories/users.py

Resource                ../resources/base.robot

Test Setup              Start Session
Test Teardown           End Session
 
***Test Cases***
Deve cadastrar um novo personagem
    [Tags]                      happy
    
    &{user}                     Factories Yoda

    Go To User Form 
    Fill User Form              ${user}
    Select Jedi                 ${user}
    Check Accept Communications 
    Submit User Form
    # Então devo ver a mensagem de sucesso
    #Sleep                       1
    #${html}                     Get Page Source
    #Log                         ${html}
    Toaster Message Should Be   Usuário cadastrado com sucesso!
    Go To Home Page 
    User Should Be visible      ${user}

Email incorreto
    [Tags]                      inv_email
    
    &{user}                     Factories Darth Vader

    
    Go To User Form 
    # Quanto preencho esse formulário com o email incorreto 
    Fill User Form              ${user}
    Check Accept Communications
    # E submeto o formulário
    Submit User Form
    # Então devo ver a mensagem de erro
    Toaster Message Should Be   Oops! O email é incorreto.

***Keywords***
Select Birth Date 
    [Arguments]                 ${text_date}
    @{date}                     Split String    ${text_date}        -
    Click                       //input[@name='Data de nascimento']
    Select Options By           (//header[@class='datepicker-header']//select)[1]   text        ${date}[0]
    Select Options By           (//header[@class='datepicker-header']//select)[2]   value       ${date}[1]
    Click                       //a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]
