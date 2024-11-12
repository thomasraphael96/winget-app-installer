# Documentação do Script de Instalação

Este documento fornece uma explicação detalhada sobre o funcionamento do script PowerShell `install.ps1`, responsável por automatizar a instalação de aplicativos no Windows usando o `winget`.

## Estrutura do Script

O script realiza as seguintes etapas principais:

1. **Carregamento do Arquivo de Configuração (`config.json`)**:
   O script carrega o arquivo JSON de configuração que define o caminho e nome do arquivo contendo os IDs dos aplicativos a serem instalados.

2. **Leitura da Lista de Aplicativos**:
   O script lê o arquivo `app_list.txt` para obter a lista de IDs dos aplicativos.

3. **Instalação dos Aplicativos**:
   Para cada ID de aplicativo, o script executa o comando `winget install` para instalar o aplicativo.

## Funcionamento Detalhado

### Carregamento do Arquivo de Configuração

O script começa carregando as configurações do arquivo `config.json`, onde são armazenados o caminho e o nome do arquivo que contém a lista de aplicativos a serem instalados. O código responsável por isso é:

```powershell
$configPath = "app\config.json"
$config = Get-Content -Path $configPath | ConvertFrom-Json
```

### Verificação e Leitura do Arquivo de Aplicativos
Após carregar a configuração, o script verifica se o arquivo que contém os IDs dos aplicativos (`app_list.txt`) existe. Ele combina o caminho e o nome do arquivo configurado em `config.json`:

```powershell
$filePath = Join-Path -Path $config.Path -ChildPath $config.FileName
if (Test-Path $filePath) {
    $apps = Get-Content -Path $filePath
} else {
    Write-Output "Arquivo $filePath não encontrado. Verifique o caminho."
}
```

Se o arquivo existir, o script lê cada linha do arquivo e armazena os IDs dos aplicativos em uma variável.

### Instalação dos Aplicativos
A função `Install-App` é definida para executar o comando de instalação para cada ID de aplicativo usando o `winget`:

```powershell
function Install-App {
    param (
        [string]$appID
    )

    Write-Output "Instalando $appID..."
    winget install --id $appID --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Output "$appID instalado com sucesso."
    } else {
        Write-Output "Erro ao instalar $appID."
    }
}
```

Este trecho instala o aplicativo silenciosamente, aceitando os acordos de licença. O código verifica o valor de `$LASTEXITCODE` para determinar se a instalação foi bem-sucedida.

### Loop de Instalação
O script então percorre cada aplicativo na lista e chama a função `Install-App` para instalar os aplicativos:

```powershell
foreach ($app in $apps) {
    Install-App -appID $app
}
```
## Considerações Finais
- Se executado em um terminal do PowerShell com privilégios de Administrador, o script realiza a instalação de aplicativos de forma silenciosa, o que significa que os aplicativos serão instalados sem interação do usuário.
- Se executado em um terminal do PowerShell sem privilégios de Administrador, o instalador solicitará confirmação do administrador.
- Se o aplicativo já tiver instalado, o winget tentará atualizá-lo para uma versão mais recente.
- Caso ocorra algum erro na instalação de um aplicativo ou o aplicativo já esteja instalado, o script imprime uma mensagem de erro no console.