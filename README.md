# Read Me

## New User Setup

### 1. Create a [GitHub Account](https://github.com/)

Go to Settings → Billing → Education Benefits → Start an Application (gives access to a lot of useful things like Copilot on VS Code)

### 2. [Generate SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

1. Open the HVMAPS VS Code workspace (link on desktop)
2. Open Git Bash terminal
    1. `Ctrl + j` to open bottom panel (if not already open)
    2. click Terminal (top left of bottom panel)
    3. click Launch Profile (`⏷` to the right of `+` at top right of bottom panel)
3. Copy and paste the following into the terminal, changing both the `firstlast`'s to your name, then press Enter

    ```bash
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_firstlast -C "firstlast"
    ```

4. Enter a passphrase (2x)

### 3. [Add SSH key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

1. Copy the key to the clipboard

     ```bash
     clip < ~/.ssh/id_ed25519_firstlast.pub
     ```

2. Go to [GitHub.com](https://github.com/) and open Profile (top right) → Settings
    * If you setup a 2FA passkey/security key (e.g. Windows Hello) on your account, sign in on the computer with access to the passkey or temporarily switch 2FA to Authenticator App
3. Click SSH and GPG keys
4. Add a Title
5. In Key, paste the SSH key
6. Click Add SSH key

### 4. Fork Repository

1. Go to <https://github.com/PierceAF/HVMAPS>
2. Fork the repository (or some other more up-to-date fork)
3. Keep the Repo name HVMAPS unless you really want to change it

### 5. Create User Profile on Lab PC

1. In HVMAPS VS Code workspace, open PowerShell terminal
2. Run the following, changing <> to the necessary info (do not include the characters "<" or ">" when you run the script)
    * RepoName is optional (defaults to HVMAPS). If you changed the Repo name to something else in [step 4](#4-fork-repository), include the name here.

    ```powershell
    .\Code\User\newuser.ps1 <First Name> <Last Name> <GitHub email> <GitHub username> <Repo Name>
    ```

    This creates a new user profile in `\Code\User\users.ps1` and `~\.ssh\config`. Each profile is stored under `firstlast` (the First and Last Name from the previous step set to lower case and no spaces, e.g `pierceaffleck`). It configures your
    * name and email used for git commits
    * GitHub username and remote repository to commit to
    * SSH key path for GitHub
3. Make and switch to a new branch of the repository for you to work on:
    * Option 1: Git Bash

        ```bash
        git checkout -b <name>
        ```

        where \<name> can be your profile name or anything else (no spaces)
    * Option 2:
        In VS Code Source Control under Repositories, click the [branch icon](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees) and Create New Branch.

## Sign in to the Lab PC

1. Open the HVMAPS VS Code workspace (link on desktop)
2. Sign in to your GitHub account (bottom left corner)
3. In PowerShell terminal, run [whoami.ps1](/Code/User/whoami.ps1) to switch to your `firstlast` user profile

    ```powershell
    .\Code\User\whoami.ps1 <firstlast>
    ```

    This sets the following from your user profile:
    * `git config user.name`
    * `git config user.email`
    * `git remote set-url origin`
    * your SSH key for GitHub
4. Switch to the branch you want to work on: `git checkout <name>` on Git Bash or using the [VS Code UI](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees)

## Sign out of the Lab PC

1. Sign out of GitHub on VS Code
2. Sign out of [GitHub.com](https://github.com/) on the browser
    * If you do not do this, anyone on the PC can sign in to your GitHub
