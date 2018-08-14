Write-Host "Começaando a Build do portainer:1803"

docker build -t portainer:1803 .;

Write-Host "A imagem portainer:1803 foi criada.";