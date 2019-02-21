$release = gc release

Write-Host "Começando a Build do $release"

docker build -t $release . ;

Write-Host "Começando push de $release"

Docker push $release