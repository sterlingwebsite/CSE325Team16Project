# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY ["Team16Project/Team16Project.csproj", "Team16Project/"]
RUN dotnet restore "Team16Project/Team16Project.csproj"

# Copy the remaining source code
COPY . .
WORKDIR "/src/Team16Project"

# Publish the application
RUN dotnet publish "Team16Project.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: Run the application
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

ENV ASPNETCORE_HTTP_PORTS=10000

EXPOSE 10000

ENTRYPOINT ["dotnet", "Team16Project.dll"]