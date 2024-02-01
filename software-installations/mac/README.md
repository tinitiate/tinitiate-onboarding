# Tinitiate Training Software Installations
* Package managers, provided by TINITIATE, contribute to a more efficient and standardized software management process, promoting consistency and reliability across Windows, Mac, and Unix-based systems.
* **Cross-Platform Package Management:**
* **Chocolatey for Windows** and **Homebrew for Mac/Unix** provide a unified and cross-platform approach to software package installations.
* Both Chocolatey and Homebrew offer a simplified and command-line-driven installation process. Users can install, update, and uninstall software packages with a single command, reducing the complexity of managing dependencies and configurations.
* Tinitiate Training Service leverages the extensive package repositories provided by Chocolatey and Homebrew. These repositories host a wide range of pre-configured software packages, ensuring that users have access to a diverse set of tools, libraries, and applications for their development and system administration needs.

## MAC / LINUX / UNIX Installation Process
### STEP 1: Install PowerShell
* Search online and install microsoft powershell
### STEP 2: Software and IDEs installations
* Open the PowerShell as administrator 
* Run the Following command:
```
curl --remote-name https://raw.githubusercontent.com/tinitiate/tinitiate-onboarding/main/software-installations/mac/script.sh
```
* Run the Following Command:
```
chmod 755 /Users/`whoami`/script.sh && ./script.sh
```
### STEP 3
* Check the installation of programs such as VSCode, DBeaver, GIT.
