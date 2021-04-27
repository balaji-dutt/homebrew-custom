# My Custom Homebrew Tap

## Why is this repo needed
Unlike `chocolatey` or most Linux package managers, `brew` does not have a native way for you to install older versions of software from the primary `homebrew/core` repo if the older version does not already exist on your local machine. The only cleanly supported way (as of April 2020) is to create a custom Homebrew "tap" and extract specific versions of the target software into the "tap".

## What packages (and package versions) does this repo currently support
|Software|Available Versions|Notes|
|--------|------------------|-----|
|Hugo| 0.70.0 `@0.70.0` <br> 0.82.0 `@0.82.0`||
|Ansible|3.3.0 `@3.3.0` <br> 3.2.0 `@3.2.0`||
|Kubernetes CLI (`kubectl`)|1.21.0 `@1.21.0`||
|Terraform|0.15 `@0.15`||
|ansible-lint|5.0.7 `@5.0.7`|Depends on `ansible@3.2.0` from this tap|
|kubectx|0.9.3 `@0.9.3`|Depends on `kubernetes-cli@1.21.0 from this tap|

## How do I install these formulae?

`brew install balaji/custom/<formula>`

Or `brew tap balaji/custom` and then `brew install <formula>`.

## How do I create my own custom Tap?
This portion is primarily taken from [this SO answer](https://stackoverflow.com/a/64125796) plus some additional insight from [another SO answer](https://stackoverflow.com/a/62822638).

```
export TAP=[github-username]/homebrew-custom
#The use of /homebrew allows for the final command to be brew install github-username/custom
brew tap-new $TAP
brew extract --version X.Y.Z package-name $TAP
cd /path/to/$TAP
git remote add origin [GitHub-URL]
git commit -am "My Homebrew Tap"
git push origin -u main
```