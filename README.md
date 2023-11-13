# Datapi DevOps Challenge

Documentação do projeto

# Instanciação de Maquina Virtual EC2 AWS:

Foi escolhida a cloud AWS para realização do projeto e Deploy por questão de familiaridade. Porém não afeta no funcionamento do projeto.

Onde é utilizado pelo arquivo apply-dev.yml para deploy na AWS. Utilizando Steps e jobs basicos para entrega da maquina EC2 na AWS 

# Dockerfile:

Foi realizado a construção do Docker file MultiStage onde em primeiro momento é possível baixar a imagem da Microsoft com a versão 6.0 do SDK para o bom teste e funcionamento do projeto, realizar copia dos arquivos e pastas principais para aplicação do restore.sh e criação do build. 
Na segunda etapa de build é possível realizar a copia do build e armazenar em uma pasta especifica onde será utiliza o resultado do build a exposição da porta e utilização do arquivo ./Server em ENTRYPOINT inicialização em tempo de execução do container.

O DockerFile é utilizado pelo arquivo de esteira na pasta .github/workflows push-registry-ghcr.yml onde existe um job basico de conexão, build e push da imagem para o registry do github onde é possível localizar em packages do repositorio.

# Arquivos Terraform

Arquivos básicos onde fazem a construção da EC2 na AWS e em paralelo também fazem a criação do K3S dentro da EC2 da AWS que é uma opção escolhida ao kubernetes pela praticidade em sua configuração. E é realizado o deploy da aplicação via manifesto com shell script.

# Destroy terraform

Existe o arquivo terraform destroy-apply.yml onde é executado manualmente o "destroy" da aplicação criada pelo terraform.