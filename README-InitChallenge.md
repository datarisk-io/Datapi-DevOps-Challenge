# Datapi DevOps Challenge

Para melhor entendermos o seu nível técnico, nós preparamos este desafio como parte do nosso processo de contratação. Por isso, tenha em mente que não é necessário cumprir com todos os pontos mencionados, nem cumpri-los em uma ordem específica.

O importante é entregar o que você conseguir fazer, com a devida documentação.

# Desafios

Segue abaixo uma lista de desafios abrangendo várias áreas de responsabilidade para um DevOps no time do Datapi. Nossa sugestão é tentar seguir cada item na ordem apresentada, porém você está livre para atuar nos pontos que quiser e tiver mais familiaridade.

- Instanciar uma VM numa cloud provider. Recomendação: Microsoft Azure.
    - Criar a configuração dessa VM usando uma ferramenta de IaC (Infrastructure as Code). Recomendação: Terraform.
    - Criar um job de CI (Continuous Integration) para aplicar a configuração da ferramenta de provisionamento. Recomendação: GitHub Actions.
- Adicionar um Dockerfile à aplicação disponibilizada na pasta `projeto-fsharp/` para containerizar o mesmo. Note que foi utilizada a linguagem F# (.NET) para escrever a aplicação. Para facilitar o entendimento do projeto, adicionamos um README.md com instruções de teste e uso do mesmo localmente. Você deverá ser capaz de traduzir essas instruções para a criação do Dockerfile.
    - Criar um job de CI para enviar a imagem gerada para um Docker Registry. Recomendação: GitHub Container Registry.
- Criar os manifestos YAML para hospedar a aplicação usando Kubernetes. Nesse ponto os testes podem ser realizados apenas localmente, porém devem ser apresentados os arquivos YAML criados.
    * Utilizar IaC para configurar o Kubernetes. Recomendação: Terraform.
    * Configurar a hospedagem a partir do registry gerado na tarefa anterior.
    * Caso possua mais familiaridade, sinta-se motivado a customizar mais as configurações (secrets, ingress, etc.).
- Adicionar um README ao projeto detalhando o processo e justificando as decisões tomadas. Recomendação: Markdown. Todos os refinamentos adicionados nos tópicos mencionados anteriormente, e demais ideias que possam melhorar o projeto serão considerados na avaliação da solução.

Faça um fork e envie um PR com a sua solução, o tempo de entrega é de no máximo 4 dias e será contabilizado a partir da data do fork.

## Será avaliado:

- % do que foi entregue em relação ao que foi pedido.
- Qualidade dos aquivos Terraform.
- Boas práticas de infra e uso do Kubernetes.
- Corretude das tarefas.
- Uso eficiente em relação ao custo de máquina.
