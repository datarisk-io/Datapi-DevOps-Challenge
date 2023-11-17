## README - Projeto de Infraestrutura com Terraform e Docker

Este repositório contém scripts Terraform para provisionar uma infraestrutura na Microsoft Azure, juntamente com um Dockerfile para construir e executar uma aplicação F#. Abaixo estão detalhados os principais componentes do projeto e as decisões tomadas durante a implementação.

### Estrutura do Projeto

- **main.tf**: Define a infraestrutura na Azure, incluindo grupos de recursos, redes virtuais, sub-redes, grupos de segurança de rede, IP público, interface de rede, e uma máquina virtual Linux.

- **Dockerfile**: Descreve a construção da imagem Docker para a aplicação F#.

### Decisões de Implementação

1. **Azure Resource Group e Localização**:
   - Foi criado um grupo de recursos chamado "datarisk-resources" na região "Brazil South".

2. **Rede Virtual e Sub-Rede**:
   - Uma rede virtual chamada "datarisk-vnet01" foi criada com o espaço de endereçamento "10.233.0.0/16".
   - Uma sub-rede chamada "datarisk-subnet01" foi criada com o prefixo "10.233.1.0/24".

3. **Grupo de Segurança de Rede (NSG)**:
   - Foi criado um NSG chamado "datarisk-nsg01" com regras para permitir tráfego SSH, HTTP (porta 80), e HTTPS (porta 443).

4. **Associação NSG com Sub-Rede**:
   - A sub-rede foi associada ao NSG para aplicar as regras de segurança.

5. **IP Público**:
   - Um IP público dinâmico foi criado para a máquina virtual.

6. **Interface de Rede**:
   - Foi criada uma interface de rede associada à sub-rede e ao IP público.

7. **Máquina Virtual Linux**:
   - Uma máquina virtual chamada "datarisk-vm01" foi criada com a imagem Ubuntu 20.04 LTS.
   - O tamanho da VM é "Standard_B2S".
   - Foram configuradas credenciais de administração (usuário e senha).

8. **Dockerfile**:
   - O Dockerfile utiliza a imagem oficial do SDK do .NET para a fase de construção e a imagem oficial do ASP.NET para a execução da aplicação.
   - São copiados os arquivos necessários e os pacotes são restaurados e a aplicação é compilada.
   - A porta 8085 é exposta para acessar a aplicação.

### Melhorias Potenciais

1. **Gerenciamento de Credenciais**:
   - Utilizar o Azure Key Vault para armazenar e gerenciar as credenciais de forma segura, em vez de mantê-las diretamente no código.

2. **Armazenamento do Estado do Terraform**:
   - Descomentar as seções relacionadas ao Azure Storage Account no arquivo `main.tf` para configurar um backend remoto do Terraform, proporcionando uma maior confiabilidade no controle de estado.

3. **Variáveis do Terraform**:
   - Utilização de variáveis do Terraform para tornar o código mais flexível e reutilizável.

4. **Automatização de Build e Deploy**:
   - Implemente pipelines de CI/CD para automatizar o processo de implantação da infraestrutura incluindo o AKS.

### Execução do Projeto

1. **Pré-requisitos**:
   - Instale o Terraform o Docker e o Azure CLI em sua máquina local. Configure as variaveis necessarias para autenticação nos serviços usados

2. **Provisionamento da Infraestrutura**:
   - Execute `terraform init` e `terraform apply` no diretório onde o arquivo `main.tf` está localizado. Ou use o action Terraform Apply.

3. **Limpeza da Infraestrutura**:
   - Execute `terraform destroy` para descomissionar os recursos provisionados quando não forem mais necessários. Ou use o action Terraform Destroy.
