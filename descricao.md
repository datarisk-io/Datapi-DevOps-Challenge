# Máquina Virtual

Na pasta `terraform` estão os arquivos para criação da máquina virtual.

- Os recursos foram nomeados usando um prefixo `datapi`. O nome do workspace também faz parte do nome, o que facilita o uso destes mesmos recursos para diferentes ambientes.
- Um ip público foi adicionado ao recurso de `network interface` para tornar a máquina acessivel externamente.
- Uma chave ssh pública foi adicionada `vm.pub` para permitir o acesso via ssh.
- A VM foi criada com linux, rodando `Ubuntu 22.04`.
- A senha de admin foi gerada de forma aleatória, e é somente exibida durante a aplicação do plano como `output`.
- O arquivo `providers` está configurado para salvar o `tfstate` em uma `storage` na Azure. O importante aqui é criar uma `key` unica para cada projeto, para evitar conflitos entre arquivos terraform.

# Docker

A construção do `Dockerfile` está dividido em duas etapas: `build` e `runtime`.

## Build

- Usa a imagem .NET SDK `6.0.x`
- Copia os arquivos do repositório
- Restaura as dependencias
- Chama o `fake build`

## Runtime

- Usa a imagem .NET Runtime `6.0.x`
- Copia os arquivos gerados pelo build
- Exporta a porta usada pelo app `8085`
- Define o `entrypoint` chamando a aplicação

A divisão dessas etapas ajuda a diminuir o tamanho da imagem final, e também mantém apenas os arquivos necessários para executar a aplicação.

# CI/CD

Foram criados dois workflows:

## publish-ghcr

Realiza o build da imagem Docker da aplicação e faz o envio para o registry do Github.

Requer algumas variaveis e segredos:
- var `REGISTRY`: a URL do registry desejado (`ghcr.io`)
- var `PROJECT_NAME`: com o nome do projeto, que vai ser usado como nome da imagem
- secret `REGISTRY_USERNAME`: o `username` do dono do repositório
- secret `REGISTRY_PASSWORD`: o token pessoal com acesso ao registry do github

A execução desse workflow foi restrito para apenas ocorrer quando houver mudanças nos arquivos da aplicação (pasta `projeto-fsharp`), ou no arquivo `Dockerfile`.

## tf-plan

Executa o `plan` do Terraform para garantir que as mudanças estão corretas.

Requer alguns segredos para autenticar com a Azure:
- secret `ARM_CLIENT_ID`: O ID da aplicação
- secret `ARM_CLIENT_SECRET`: O segredo criado para a aplicação
- secret `ARM_SUBSCRIPTION_ID`: O ID da `subscription` da conta
- secret `ARM_TENANT_ID`: O ID do `tenant` da aplicação

A execução desse workflow foi restrito para ser executado apenas em `pull requests` se arquivos da pasta `terraform` foram modificados.

# Kubernetes

Os arquivos YAML para deploy da aplicação em um cluster Kubernetes.

Todo o deploy foi criado usando um arquivo de `kustomization`, que lista os demais arquivos:
- `namespace.yaml`: cria um namespace para aplicação
- `deployment.yaml`: configura o deployment do app
- `secret.yaml`: cria um segredo com a autenticação com o GHCR.io

O arquivo de `kustomization` também inclui labels comuns para todos os serviços (app, env, version), que faciliam o controle para diferentes apps e ambientes.

Utilizar secrets como feito nesse exemplo não é recomendado pois pode expor dados sensíveis, como o token de auth para o GHCR. Nesses casos é melhor usar ferramentas como `Sealed Secrets` ou `External Secret`, que são aplicações que rodam no cluster Kubernetes, e são usados para encriptar segredos, tornando mais seguro comitar esses arquivos em repositórios git.
