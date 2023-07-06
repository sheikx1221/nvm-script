# nvm-script

## Steps to run the script in vscode automatically when you open a terminal
- Download the nvm-select.sh file
- Keep it somewhere accessible like ~/scripts
- Open vscode > settings.json
- Remove default profile key `terminal.integrated.defaultProfile.osx`
- Paste the following code
```
    "terminal.integrated.defaultProfile.osx": "nvm-zsh",
    "terminal.integrated.profiles.osx": {
        "nvm-zsh": {
            "path": "/bin/zsh",
            "args": [
                "-l",
                "-c",
                "source ~/scripts/nvm-select.sh; zsh"
            ]
        }
    }
```
- Save the file
- Reopen your integrated terminal

## Note
Since I am using macOS, my default terminal key ends with .osx. If you are using windows, you will use "defaultProfile.windows" and for linux you will use "defaultProfile.linux"

Also, zsh terminal may not be available in OS other than mac, so make sure to change it to bash by replacing zsh to bash everywhere
