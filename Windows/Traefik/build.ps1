Write-Host "Começando a Build do traefik:1803"

docker build -t traefik_sgi:1803 . ;

Write-Host "Build finalizada."