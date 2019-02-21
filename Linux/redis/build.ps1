$ErrorActionPreference = 'Stop'

Write-Host "Preparando variáveis."

$DataAtual = Get-Date
$release = Get-Content release
$BUILD_DATE = [Xml.XmlConvert]::ToString(($DataAtual),[Xml.XmlDateTimeSerializationMode]::Utc)
$VCS_REF = "60db7082c81f5d457046f199244c5d651f04b3fa"
$BUILD_VERSION = (New-TimeSpan -Start (Get-Date "01/01/1970") -End ($DataAtual)).TotalSeconds

Write-Host "Iniciando Build."

docker build -t $release --build-arg BUILD_DATE=$BUILD_DATE `
                        --build-arg VCS_REF=$VCS_REF `
                        --build-arg BUILD_VERSION=$BUILD_VERSION . 

Write-Host "A build foi um sucesso!"

Write-Host "Iniciando Push..."

docker push $release

Write-Host "O push foi um sucesso!"