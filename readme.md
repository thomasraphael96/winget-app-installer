# Projeto de Instalação Automatizada de Aplicativos via Winget

Este projeto permite a instalação automatizada de uma lista de aplicativos no Windows usando o gerenciador de pacotes `winget`. O script lê um arquivo de configuração (`config.json`) e uma lista de aplicativos (`app_list.txt`) para realizar a instalação.

## Estrutura do Projeto

- **app\config.json**: Contém configurações, incluindo o caminho base e o nome do arquivo que lista os IDs dos aplicativos.
- **app_list.txt**: Arquivo contendo os IDs dos aplicativos a serem instalados, com um ID por linha.
- **install.ps1**: Script principal que carrega o arquivo de configuração, lê a lista de aplicativos e realiza a instalação de cada um usando `winget`.

## Pré-requisitos

1. **Windows 10/11** com o `winget` instalado e atualizado.
2. Permissões de administrador para execução do script.
3. **Configurar a política de execução do PowerShell** para permitir a execução de scripts. Você pode fazer isso executando o seguinte comando no PowerShell (como Administrador):

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
4. A lista de aplicativos deve estar no arquivo `app_list.txt`, e cada ID deve ser compatível com o repositório do `winget`.

## Configuração

1. No arquivo `app\config.json`, defina:
   - `"Path"`: Caminho da pasta onde está o arquivo `app_list.txt`.
   - `"FileName"`: Nome do arquivo que contém a lista de IDs de aplicativos.

Exemplo de `config.json`:

```json
{
    "Path": "C:\\Users\\User\\Desktop\\",
    "FileName": "app_list.txt"
}
```

## Como Usar o Script
1. Coloque o arquivo app_list.txt no diretório especificado no config.json. O arquivo app_list.txt deve conter os IDs dos aplicativos que você deseja instalar, um ID por linha:

```
Google.Chrome
Spotify.Spotify
Flameshot.Flameshot
```

2. Abra o PowerShell como administrador.

3. Execute o script install.ps1:

```powershell
.\install.ps1
```

## Funcionamento do Script

1. O script carrega o arquivo config.json para obter as configurações de caminho.
2. Ele combina o caminho da pasta com o nome do arquivo para localizar app_list.txt.
3. O script verifica se app_list.txt existe. Caso contrário, exibe uma mensagem de erro.
4. Para cada ID de aplicativo listado em app_list.txt, o script executa o comando winget install, que instala o aplicativo de forma silenciosa.


## Observações
- Certifique-se de que todos os IDs em app_list.txt estejam corretos e sejam válidos no repositório do winget.