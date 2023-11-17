FROM mcr.microsoft.com/dotnet/sdk:6.0.413 AS build

WORKDIR /app

# Copiar os arquivos necessários
COPY ./projeto-fsharp .

RUN ls -la

# Restaurar pacotes
RUN chmod +x restore.sh
RUN ./restore.sh

# Compilar a aplicação
RUN dotnet fake run build.fsx -t "Build"

FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

COPY --from=build /app/src/Server/out .

RUN chmod +x Server

# Expor a porta 8085 para acessar a aplicação
EXPOSE 8085

CMD ["./Server"]
