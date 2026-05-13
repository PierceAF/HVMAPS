# Read Me

## New User Setup

### 1. Create a [GitHub Account](https://github.com/)

* Go to Settings → Billing → Education Benefits → Start an Application (gives access to a lot of useful things like Copilot on VS Code)

### 2. [Generate SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

1. In VS Code, open Git Bash terminal
2. Copy and paste the following into the terminal, changing both the `firstlast` to your name, then press Enter

    ```bash
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_firstlast -C "firstlast"
    ```

3. Enter a passphrase (2x)

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
2. Fork this repository (or some other more up-to-date fork)
3. Keep the Repo name HVMAPS unless you really want to change it

### 5. Add User Profile

1. In VS Code, open PowerShell terminal
2. In HVMAPS directory, run the following, changing <> to the necessary info (do not include <> when you run the script)
    * RepoName is optional (defaults to HVMAPS). If you changed the Repo name to something else in [step 4](#4-fork-repository), include the name here.

    ```powershell
    .\Code\User\newuser.ps1 <First Name> <Last Name> <GitHub email> <GitHub username> <RepoName>
    ```

    This should put your info in [whoami.ps1](/Code/User/whoami.ps1) (under `$Users`) and in `~/.ssh/config`
<!-- 3. Running the script will also check the SSH connection to GitHub
    1. Type `yes` and press Enter
    2. Type your SSH password and press Enter -->
