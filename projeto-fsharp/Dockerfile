FROM mcr.microsoft.com/dotnet/sdk:6.0.413

WORKDIR /app

COPY . .

RUN dotnet tool restore

RUN dotnet paket install

RUN dotnet paket restore

RUN dotnet fake run build.fsx -t "Build"

COPY ./src/Server /app

EXPOSE 8085

CMD ["./Server"]