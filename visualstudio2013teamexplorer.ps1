# Define the download URL for Visual Studio 2013 Team Explorer
$installerUrl = "https://download.microsoft.com/download/3/B/8/3B8CA18C-6B96-4D1D-9D3D-531A423FAD57/vs_teamExplorer.exe"

# Define the installation path for Visual Studio 2013 Team Explorer
$installPath = "C:\Program Files (x86)\Microsoft Visual Studio 12.0"

# Define the temporary file path for the installer
$installerPath = "$env:TEMP\vs_teamExplorer.exe"

# Download the Visual Studio 2013 Team Explorer installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Install Visual Studio 2013 Team Explorer
Start-Process -FilePath $installerPath -ArgumentList "/q", "/adminfile $installPath\vs_teamExplorer.ini" -Wait

# Clean up the temporary installer file
Remove-Item $installerPath -Force
