#Primeiro criaremos o ambiente de trabalho.
mkdir Build;
Copy-Item certoc.exe Build;
Set-Location Build;
mkdir certificates;

#Agora criaremos um array, onde iremos salvar todo o conteudo do Dockerfile.
$Dockerfile = @();

#Agora devemos fazer download das cadeias de certificados do ITI.GOV.
Invoke-WebRequest -Uri https://acraiz.icpbrasil.gov.br/repositorio/v1_v2_v3_v5_goochr.p7b -OutFile "v1_v2_v3_v5_goochr.p7b"  -UseBasicParsing

#Para evitar incompatibilidades, criaremos uma variavel com o arquivo de certificados.
$CertificateFile = Get-ChildItem v1_v2_v3_v5_goochr.p7b;
$CertificateFilePath = $CertificateFile.fullname;

#Agora iremos explodir em varios arquivos os certificados presentes no p7b que conseguimos no passo anterior.
[reflection.assembly]::LoadWithPartialName("System.Security");
$data = [System.IO.File]::ReadAllBytes($CertificateFilePath);
$cms = new-object system.security.cryptography.pkcs.signedcms;
$cms.Decode($data);

#Com os dados decodificados, iremos um por um, exporta-los na pasta certificates.
foreach($i in $cms.Certificates){

    $name = $i.Thumbprint;

    $i | Export-Certificate -FilePath "certificates\$name.cer";

}

#Agora verificaremos se todos os arquivos necessarios para a criação da Dockerfile estão presentes.
if (!(Test-Path "certificates")){

    Write-Host "A pasta certificate não existe!";
}

if (!(Test-Path "certoc.exe")){

    Write-Host "O arquivo certoc.exe não foi encontrado!";
}

$Dockerfile += @'
# escape=`

FROM microsoft/nanoserver:1803

USER ContainerAdministrator

COPY certoc.exe certoc.exe
COPY certificates certificates

RUN for %v in (c:\certificates\*.cer) do c:\certoc.exe -addstore root %v

'@

$Workdir = Get-Location;

$Dockerfile += @'

RUN del /F /S /Q c:\certificates && del /F /Q c:\certoc.exe
RUN rmdir c:\certificates

USER ContainerUser

'@

#Agora vamos salvar a Dockerfile.

$Dockerfile | Add-Content -Path $Workdir\Dockerfile;

docker build -t nanoserver_base:1803 .;

Write-Host "A imagem nanoserver_base:1803 foi criada.";