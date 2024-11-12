# Carrega o arquivo JSON
$configPath = "app\config.json"
$config = Get-Content -Path $configPath | ConvertFrom-Json

# Caminho do arquivo com os IDs dos aplicativos
$filePath = Join-Path -Path $config.Path -ChildPath $config.FileName

# Verifica se o arquivo existe
if (Test-Path $filePath) {
    # Lê o conteúdo do arquivo em uma lista de aplicativos
    $apps = Get-Content -Path $filePath

    # Função para instalar um aplicativo pelo ID com winget
    function Install-App {
        param (
            [string]$appID
        )

        # Comando para instalar o aplicativo pelo ID
        Write-Output "Instalando $appID..."
        winget install --id $appID --silent --accept-package-agreements --accept-source-agreements
        
        # Verifica se a instalação foi bem-sucedida
        if ($LASTEXITCODE -eq 0) {
            Write-Output "$appID instalado com sucesso."
        } else {
            Write-Output "Erro ao instalar $appID."
        }
    }

    # Loop para instalar todos os aplicativos da lista
    foreach ($app in $apps) {
        Install-App -appID $app
    }
} else {
    Write-Output "Arquivo $filePath não encontrado. Verifique o caminho."
}