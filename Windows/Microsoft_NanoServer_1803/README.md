# Windows NanoServer build 1803

O NanoServer 1803 é uma imagem criada pela Microsoft pensando em Containers. Por isto ela é extremamente enxuta.

Nesta versão adicionei os certificados disponiveis na ITI.gov.br, para melhor desempenho utilizando certificados digitais. 

Para isto, utilizei o aplicativo "certoc.exe", disponivel na SDK de desenvilvimento do Windows 10 e um script powershell
para dividir o arquivo p7b em arquivos cer.


# Modo de usar:

execute o script build.ps1. Ele irá criar uma Dockerfile e executar a build da imagem. A imagem criada será: nanoserver_base:1803.