# Documentação do Arquivo de Configuração (`config.json`)

Este documento explica o funcionamento do arquivo de configuração `config.json`, que contém informações sobre o caminho e o nome do arquivo de entrada com a lista de aplicativos a serem instalados.

## Estrutura do Arquivo `config.json`

O arquivo `config.json` deve ter a seguinte estrutura:

```json
{
    "Path": "C:\\Users\\thora\\Desktop\\",
    "FileName": "app_list.txt"
}
```

## Campos
- Path: Define o caminho completo até a pasta onde o arquivo de lista de aplicativos (app_list.txt) está localizado.

Exemplo:

```json
"Path": "C:\\Users\\thora\\Desktop\\"
```
Este caminho pode ser alterado conforme a localização do seu arquivo de lista de aplicativos.

- FileName: O nome do arquivo que contém a lista de IDs dos aplicativos a serem instalados. O arquivo deve estar no formato de texto simples, com um ID de aplicativo por linha.

Exemplo:

```json
"FileName": "app_list.txt"
```

## Considerações
- O caminho fornecido no Path deve ser absoluto, ou seja, o caminho completo para a pasta onde o arquivo app_list.txt está localizado.
- O arquivo app_list.txt deve conter apenas IDs de aplicativos válidos, um por linha, que são compatíveis com o repositório winget.