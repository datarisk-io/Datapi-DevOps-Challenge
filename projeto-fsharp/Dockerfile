# Define a imagem base para o ambiente de construção
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS builder

# Define o diretório de trabalho dentro do contêiner
WORKDIR /workspace

# Copia todos os arquivos do projeto para o diretório de trabalho
COPY projeto-fsharp .

# Instala dotnet tool e paket
RUN dotnet tool restore \
    && dotnet paket install \
    && dotnet paket restore

# Compila o projeto
RUN dotnet fake run build.fsx --target "Build"

# Define a imagem base para o ambiente de runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

# Define o diretório de trabalho para o ambiente de runtime
WORKDIR /app

# Copia o resultado da compilação do estágio de construção para o ambiente de runtime
COPY --from=builder /workspace/src/Server/out /app

# Exponha a porta na qual a aplicação estará escutando
EXPOSE 8085

# Define o comando para iniciar a aplicação
CMD ["dotnet", "Server.dll"]
