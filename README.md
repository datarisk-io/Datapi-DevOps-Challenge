## Documentação do Projeto Datapi DevOps Challenge

### 1. Estrutura do Projeto

#### **Diretório `infraservices`**

- **`terras/`**:
  - Contém arquivos de configuração do Terraform para provisionamento da infraestrutura na Azure.

  **Arquivos:**
  - `main.tf`:
    - Define os recursos principais na Azure, incluindo Resource Group, Virtual Network, Subnet, Network Interface, Virtual Machine e Public IP.
  - `output.tf`:
    - Define as saídas do Terraform, que fornecem informações sobre o estado dos recursos criados.
  - `provider.tf`:
    - Configura o provedor Azure com as credenciais e recursos necessários.
  - `variable.tf`:
    - Define variáveis usadas para parametrizar a configuração da infraestrutura.

- **`k8s/`**:
  - Contém arquivos de configuração para Kubernetes.

  **Arquivos:**
  - `deploy.yml`:
    - Define o Deployment e o Service para a aplicação F# no Kubernetes.
    - **Deployment**:
      - Configura o Deployment da aplicação F#, incluindo o número de réplicas, a imagem Docker e os recursos solicitados (CPU e memória).
    - **Service**:
      - Define o Service Kubernetes para expor a aplicação F# externamente, utilizando um LoadBalancer.

- **`token/`**:
  - Contém arquivos de chave e autenticação para a infraestrutura.

  **Arquivos:**
  - `id_rsa.pub`:
    - Chave pública SSH para autenticação na máquina virtual provisionada.

#### **Diretório `projeto-fsharp`**

- **Contém o código da aplicação F# e o Dockerfile para criar a imagem Docker da aplicação.**

  **Arquivos:**
  - `Dockerfile`:
    - Define as etapas para construir a imagem Docker da aplicação F#, incluindo a configuração do ambiente de execução e a cópia dos arquivos de build.
  - `build.fsx`:
    - Script de build da aplicação F#.
  - `restore.sh`:
    - Script para restaurar as dependências da aplicação.
  - `README.md`:
    - Documento explicativo sobre o projeto F# e instruções de uso.

---

### 2. Documentação dos Arquivos e Funcionalidades

#### **Terraform**

- **`main.tf`**:
  - **Resource Group**:
    - Cria um grupo de recursos na Azure.
  - **Virtual Network**:
    - Cria uma rede virtual com um espaço de endereços específico.
  - **Subnet**:
    - Cria uma sub-rede dentro da rede virtual.
  - **Network Interface**:
    - Cria uma interface de rede para a máquina virtual.
  - **Linux Virtual Machine**:
    - Provisiona uma máquina virtual Linux com configuração de rede e autenticação SSH.
  - **Public IP**:
    - Cria um IP público para acesso externo à máquina virtual.

- **`output.tf`**:
  - **resource_group_name**: Nome do grupo de recursos.
  - **virtual_network_name**: Nome da rede virtual.
  - **subnet_id**: ID da sub-rede.
  - **vm_public_ip**: Endereço IP público da máquina virtual.

- **`provider.tf`**:
  - Configuração do provedor Azure com as credenciais e configuração necessárias para o Terraform.

- **`variable.tf`**:
  - Define variáveis usadas em `main.tf`, como nome do grupo de recursos, localização e IDs de assinatura.

#### **Kubernetes**

- **`deploy.yml`**:
  - **Deployment**:
    - Define como a aplicação F# será implantada no Kubernetes, incluindo a configuração da imagem Docker e os recursos necessários.
  - **Service**:
    - Define como a aplicação será exposta externamente usando um LoadBalancer.

#### **GitHub Actions**

- **`.github/workflows/kubernetes.yml`**:
  - **Build Job**:
    - Configura o Docker Buildx.
    - Faz login no DockerHub usando credenciais armazenadas em segredos.
    - Constrói e faz push da imagem Docker para o DockerHub.
  - **Deploy Job**:
    - Configura o `kubectl` para interagir com o cluster Kubernetes.
    - Aplica o arquivo `deploy.yml` para realizar o deploy da aplicação no Kubernetes.

- **`terra.yml`**:
  - **Terraform Job**:
    - Configura o Terraform para executar o `terraform plan` e verificar as mudanças na infraestrutura.
    - Usa variáveis de ambiente para autenticação com Azure.

---