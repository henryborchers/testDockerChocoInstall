FROM mcr.microsoft.com/dotnet/framework/sdk:3.5
ADD choco.ps1 choco.ps1
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
ARG CHOCOLATEY_REPO=https://jenkins.library.illinois.edu/nexus/repository/chocolatey-proxy/
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; ./choco.ps1 -packageRepo $env:CHOCOLATEY_REPO
RUN choco install -y 7zip
