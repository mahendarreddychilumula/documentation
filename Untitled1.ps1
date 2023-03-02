##Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
Invoke-WebRequest -Uri https://github.com/technext/soffer/archive/refs/tags/v1.0.0.zip -OutFile C:\Users\mahendar\Desktop\mahi.zip.zip
Expand-Archive -LiteralPath C:\Users\mahendar\Desktop\mahi.zip.zip -DestinationPath C:\Users\mahendar\Desktop\unzip
cd C:\Users\Downloads
New-Item -Path . -Name sight -Force -ItemType Directory
Move-Item -Path C:\Users\Desktop\unzip -Destination C:\Users\mahendar\Downloads\sight
cd C:\Users\mahendar\Downloads\sight\unzip\soffer-1.0.0
.\index.html