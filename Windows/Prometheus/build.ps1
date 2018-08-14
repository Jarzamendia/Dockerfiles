Write-Host "Começando a Build do prometheus:1803"

docker build -t prometheus:1803 . ;

Write-Host "Build finalizada."