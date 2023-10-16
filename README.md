# Datapi-DevOps-Challenge

- Instanciar uma VM numa cloud provider. Recomendação: Microsoft Azure.
- Criar a configuração dessa VM usando uma ferramenta de IaC (Infrastructure as Code). Recomendação: Terraform.
  - Criar um job de CI (Continuous Integration) para aplicar a configuração da ferramenta de provisionamento. Recomendação: GitHub Actions.
- Adicionar um Dockerfile à aplicação disponibilizada na pasta projeto-fsharp/ para containerizar o mesmo. Note que foi utilizada a linguagem F# (.NET) para escrever a aplicação.
  - Para facilitar o entendimento do projeto, adicionamos um README.md com instruções de teste e uso do mesmo localmente. Você deverá ser capaz de traduzir essas instruções para a criação do Dockerfile.
  - Criar um job de CI para enviar a imagem gerada para um Docker Registry. Recomendação: GitHub Container Registry.(Awaiting)
- Criar os manifestos YAML para hospedar a aplicação usando Kubernetes. Nesse ponto os testes podem ser realizados apenas localmente, porém devem ser apresentados os arquivos YAML criados. Recomendação: Minikube.
  - Configuração inicial a partir do registry gerado da etapa anterior
  - Simular um deployment utilizando Kubernetes
  - Fazer configurações do Kubernetes utilizando terraform

Adicionar um README ao projeto detalhando o processo e justificando as decisões tomadas. Recomendação: Markdown.
Todos os refinamentos adicionados nos tópicos mencionados anteriormente, e demais ideias que possam melhorar o projeto serão considerados na avaliação da solução.

Faça um fork desse projeto e envie um PR com a sua solução, o tempo de entrega é de no máximo 4 dias e será contabilizado a partir da data do fork.
