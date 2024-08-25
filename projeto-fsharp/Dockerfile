# Define the .NET SDK image as the build environment
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS builder

# Set the working directory inside the container
WORKDIR /workspace

# Copy all necessary files to the build environment
COPY projeto-fsharp .

# Restore dependencies using the provided script
RUN bash restore.sh

# Compile the application using the build script
RUN dotnet fake run build.fsx --target "Build"

# Define the runtime environment for the application
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

# Set the working directory for the runtime environment
WORKDIR /app

# Copy the built application from the builder stage to the runtime stage
COPY --from=builder /workspace/src/Server/out /app

# Expose the application port
EXPOSE 8085

# Specify the command to run the application
CMD ["dotnet", "Server.dll"]
