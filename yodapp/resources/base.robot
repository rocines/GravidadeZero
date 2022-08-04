***Settings***
Documentation       Arquivo principal do projeto

Library             Browser
Library             String



***Variables***
${BASE_URL}              https://yodapp-testing.vercel.app

***Keywords***
Start Session
    New Browser     chromium        headless=false      #headless=true > navegador não abre, false > navegador abre
    New Page        ${BASE_URL}

End Session
    Take Screenshot