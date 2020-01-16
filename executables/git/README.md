# Git configuration

Go to your terminal and run this command from the root folder like this:
```bash
./executables/git/git_setup.sh
```

The script will do the following:

- Look for `git-completion`, if not present it will download and save it to your `HOME` folder as `.git-completion.bash`
- Checks for either `.bash_profiles` or `.bashrc` and prompt you to create them if not found
- If it finds one of the above, it will look for a previous version of the configuration provided by the script, if found it will delete it
- It will save the newest version of the configuration, which includes branch parsing name in the terminal, integration with `git-completion` and all the aliases listed in [here](../../docs/git.md)