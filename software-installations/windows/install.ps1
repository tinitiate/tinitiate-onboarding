$checkchoco=((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "chocolatey").Length -gt 0
if(-not($checkchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $checkchoco is already installed"
}

# Check if Python 3.9 is installed
if ((python --version 2>&1) -match "Python 3.9") {
    Write-Host "Python 3.9 is already installed."
} 
else {
    Write-Host "Python 3.9 is not installed. Installing Python 3.9 using Chocolatey package manager."
    choco install python -y
}

$checkawscli = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "aws").Length -gt 0
if(-not($checkawscli)){
    Write-Output "Seems AWS CLI is not installed, installing now"
    powershell choco install awscli -y
}
else{
    Write-Output "AWS CLI Version is already installed"
}

$checksamcli = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "sam").Length -gt 0
if(-not($checksamcli)){
    Write-Output "Seems SAM CLI is not installed, installing now"
    powershell choco install awssamcli --version=1.60.0 -y
}
else{
    Write-Output "SAM CLI Version is already installed"
}

$check = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "DBeaver").Length -gt 0
if(-not($check)){
    Write-Output "Seems AWS SSM is not installed, installing now"
    powershell choco install dbeaver -y
}
else{
    Write-Output "dbeaver is already installed"
}

$check = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Microsoft Visual Studio Code").Length -gt 0
if(-not($check)){
    Write-Output "Seems AWS Visual Studio Code is not installed, installing now"
    powershell choco install vscode -y
    # Install Visual Studio Code extensions
    Write-Output "Installing Visual Studio Code extensions"
    code --install-extension alefragnani.project-manager
    code --install-extension amazonwebservices.aws-toolkit-vscode
    code --install-extension bierner.markdown-preview-github-styles
    code --install-extension Boto3typed.boto3-ide
    code --install-extension evilz.vscode-reveal
    code --install-extension gera2ld.markmap-vscode
    code --install-extension marp-team.marp-vscode
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-vscode.live-server
    code --install-extension ms-vscode.notepadplusplus-keybindings
    code --install-extension qcz.text-power-tools
    code --install-extension zeshuaro.vscode-python-poetry
}
else{
    Write-Output "Visual Studio Code is already installed"
    Write-Output "Installing/updating Visual Studio Code extensions"
    code --install-extension alefragnani.project-manager
    code --install-extension amazonwebservices.aws-toolkit-vscode
    code --install-extension bierner.markdown-preview-github-styles
    code --install-extension Boto3typed.boto3-ide
    code --install-extension evilz.vscode-reveal
    code --install-extension gera2ld.markmap-vscode
    code --install-extension marp-team.marp-vscode
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-vscode.live-server
    code --install-extension ms-vscode.notepadplusplus-keybindings
    code --install-extension qcz.text-power-tools
    code --install-extension zeshuaro.vscode-python-poetry
}

$check = powershell pip --version
if(-not($check)){
    Write-Output "Seems pip is not installed, installing now"
    powershell choco install pip -y
}
else{
    Write-Output "pip is already installed"
}

$checkpip = powershell pip --version
if($checkpip){
    Write-Output "Seems pip is installed, installing packages now"
    powershell pip install PyMySQL 
    powershell pip install django
    powershell pip install djangorestframework
    powershell pip install pytz
    powershell pip install djoser
    powershell pip install psycopg2
}
else{
    Write-Output "Pip is not installed"
}

$w64=Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | where-Object DisplayName -like 'NotePad++*'
$w32=Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*  | where-Object DisplayName -like 'NotePad++*'
if(-not($w64-or $w32)){
    Write-Output "Seems notepad++ is not installed, installing now"
    choco install notepadplusplus -y
}
else{
    Write-Output "notepad++ is already installed"
}

$check = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "git").Length -gt 0
if(-not($check)){
    Write-Output "Seems Git is not installed, installing now"
    powershell choco install git -y
}
else{
    Write-Output "Git is already installed"
}

# Check if Microsoft-Windows-Subsystem-Linux feature is enabled
$wslEnabled = dism.exe /online /Get-FeatureInfo /FeatureName:Microsoft-Windows-Subsystem-Linux | Select-String -SimpleMatch "State : Enabled"
if(-not $wslEnabled){
    Write-Output "Microsoft-Windows-Subsystem-Linux feature is not enabled, enabling now"
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
}

# Check if VirtualMachinePlatform feature is enabled
$vmpEnabled = dism.exe /online /Get-FeatureInfo /FeatureName:VirtualMachinePlatform | Select-String -SimpleMatch "State : Enabled"
if(-not $vmpEnabled){
    Write-Output "VirtualMachinePlatform feature is not enabled, enabling now"
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
}

# Check if WSL2 is installed
$wsl2Installed = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object {$_.DisplayName -eq "Ubuntu"}
if(-not $wsl2Installed){
    Write-Output "WSL2 is not installed, downloading and installing now"
    $url = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
    $filePath = "$env:TEMP\wsl_update_x64.msi"
    Invoke-WebRequest -Uri $url -OutFile $filePath
    Start-Process msiexec.exe -ArgumentList "/i $filePath /quiet /norestart" -Wait
}

$checkdocker = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Docker").Length -gt 0
if(-not($checkdocker)){
    Write-Output "Seems Docker is not installed, installing now"
    powershell choco install docker-desktop -y
 }
 else{
    Write-Output "Docker is already installed"
 }
