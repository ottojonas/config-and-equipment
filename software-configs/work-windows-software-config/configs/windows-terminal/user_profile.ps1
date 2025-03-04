# ------------------------------------------------------------------
# Terminal & Theme Configuration
# ------------------------------------------------------------------

# Import the Terminal-Icons module for enhanced file icons in the terminal
Import-Module -Name Terminal-Icons

# Initialize oh-my-posh with the specified configuration for a custom prompt theme
oh-my-posh init pwsh --config 'C:\Users\otto.jonas\.config\ohmyposh\zen.toml' | Invoke-Expression


# ------------------------------------------------------------------
# Basic Alias Definitions
# ------------------------------------------------------------------

# Editor alias
Set-Alias -Name vim -Value nvim

# Common command aliases
Set-Alias ll ls
Set-Alias mkfile New-Item

# Git alias (shortcut for git commands)
Set-Alias g git

# LazyGit alias for a more visual git interface
Set-Alias lg lazygit

# Alias for search using Windows findstr
Set-Alias grep findstr

# Tig and less from Git for Windows
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Alias for docker-compose
Set-Alias dc docker-compose


# ------------------------------------------------------------------
# Git Alias Functions: In-Depth Git Shortcuts for PowerShell
# ------------------------------------------------------------------

## Basic Git Commands
function ga { git add $args }
function gaa { git add . }
function gc { git commit $args }
function gcm {
    $msg = $args -join " " 
    git commit -m "$msg"
}

## Branch & Checkout Management
function gb { git branch $args }
function gco { git checkout $args }
function gcb { git checkout -b $args }

## Status, Diff, and Log
function gs { git status $args }
function gd { git diff $args }
function gds { git diff --staged $args }
function gl { git log $args }
function glg { git log --graph --oneline --decorate --all $args }
function glp { git log --pretty=format:"%C(yellow)%h%Creset - %C(green)(%cd)%Creset %C(blue)[%an]%Creset %s" --date=short $args }

## Remote and Push/Pull Operations
function gpl { git pull $args }
function gps { git push $args }
function gpf { git push -f $args }
function gr { git remote $args }
function grv { git remote -v $args }

## Merging, Rebasing, and Cherry-Picking
function gm { git merge $args }
function grbi { git rebase -i $args }
function grb { git rebase $args }
function gcp { git cherry-pick $args }

## Reset and Cleanup
function grs { git reset $args }
function grh { git reset --hard $args }
function gcclr {
    # Remove local branches that have already been merged (excluding master and main)
    git branch --merged | ForEach-Object { $_.Trim() } | Where-Object { $_ -notin @("master", "main") } | ForEach-Object { git branch -d $_ }
}

## Stash Management
function gst { git stash $args }
function gpop { git stash pop $args }
function gsta { git stash apply $args }
function gstl { git stash list $args }
function gsave { git stash push -m ($args -join " ") }

## Additional Useful Aliases
function gblame { git blame $args }
function gfind { git grep $args }
function grm { git rm $args }
function gls { git tag -l $args }
