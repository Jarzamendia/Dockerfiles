Write-Host "Começaando a Build do grafana:1803"

docker build -t grafana:1803 . ;

Write-Host "Build finalizada."