# Contribuindo para o Projeto de Instalação Automatizada com PowerShell

Obrigado por considerar contribuir para este projeto! Este documento fornece orientações para quem deseja colaborar. Todas as contribuições são bem-vindas, incluindo sugestões de melhoria, correções de bugs e novas funcionalidades.

## Requisitos para Contribuir

Antes de começar, certifique-se de que você:

1. Possui **Git** e **PowerShell** instalados e configurados em sua máquina.
2. Está familiarizado com o gerenciador de pacotes **winget**, utilizado para instalar aplicativos.

### Pré-requisitos do Projeto

- **Execution Policy**: Certifique-se de definir a política de execução do PowerShell para permitir scripts locais. Execute o seguinte comando no PowerShell como administrador:

```powershell
Set-ExecutionPolicy RemoteSigned
```

## Estrutura do Projeto
- app/install.ps1: Script principal para instalação de aplicativos com o winget, lendo IDs de aplicativos a partir de um arquivo de configuração.
- app/config.json: Arquivo JSON de configuração que especifica o caminho e o nome do arquivo contendo a lista de IDs dos aplicativos.

## Como Contribuir
1. Faça um Fork do Projeto.

    Clique em "Fork" no GitHub para criar uma cópia do projeto em sua conta. Clone seu fork para a sua máquina com o comando:
  
```bash
git clone https://github.com/seu-usuario/nome-do-projeto.git
```

2. Crie uma Branch para Sua Contribuição.

    Recomendamos criar uma nova branch para organizar seu trabalho:

```bash
git checkout -b minha-feature
```

3. Faça Suas Alterações

    Faça suas alterações no código ou documentação. Se você estiver corrigindo um bug ou adicionando uma nova funcionalidade, documente no código ou atualize o README.md se necessário.

4. Teste Suas Alterações

    Execute o script para verificar se suas alterações funcionam corretamente e não quebram funcionalidades existentes. Você pode rodar o script com o seguinte comando:

```bash
.\app\install.ps1
```

5. Commite Suas Alterações

    Após testar, faça o commit das suas alterações com uma mensagem clara e descritiva:
    
```bash
git add .
git commit -m "Descrição das alterações"
```
6. Envie Suas Alterações para o GitHub

    Envie suas alterações para o seu repositório no GitHub:

```bash
git push origin minha-feature
```

7. Abra um Pull Request

    No GitHub, abra um Pull Request (PR) de sua branch para a branch principal do repositório. Explique no PR as alterações feitas e o motivo delas.

## Diretrizes para Contribuição

- Mantenha o código claro e bem documentado.
- Se estiver adicionando uma nova funcionalidade, explique no PR como ela funciona e, se possível, inclua exemplos de uso.
- Certifique-se de que o código segue o estilo do projeto e que as dependências necessárias estão documentadas.

## Feedback
Após enviar o PR, ele será analisado e revisado. Comentários podem ser feitos solicitando alterações ou melhorias. Agradeço sua paciência e colaboração!