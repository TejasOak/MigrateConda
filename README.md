# CondaToPyenv
## Guidelines for migrating a conda environment to pyenv

1. Activate your conda environment as usual. Note the exact python version the environment is using.
 
```
  python --version
  ```

2. Export the list of packages from conda supported by pip's format:
   ```
   pip list --format=freeze > requirements.txt
   ```  
3. Create/Navigate to the directory where you wish to install pyenv (all python versions and environments will be located here later on.)
4. Clone the pyenv repo 
```
git clone https://github.com/pyenv/pyenv.git PATH_TO_YOUR_DIR
```
5. Configure your shell (bashrc) to use pyenv
```
echo 'export PYENV_ROOT="PATH_TO_YOUR_DIR"' >> ~/.bashrc
```
```
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
```
6. Also configure ~/.profile (you may alternatively have `~/.bash_profile` or `~/.bash_login` ; see https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv for help) 

```
echo 'export PYENV_ROOT="PATH_TO_YOUR_DIR"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile

```
7. Replace the shell instance to apply the changes 
```
exec "$SHELL"
```
> At this point, you should have pyenv installed, try running `pyenv versions` to see the default python version on the system

8. Clone the virtualenv plugin 
```
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

9. Install the needed python version within pyenv,e.g.
```
pyenv install 3.10.14
```

10. create a vanilla environment (with the same name as conda?)

```
pyenv virtualenv 3.10.14 my_env
exec "$SHELL"
```
11. Activate the environment 

```
pyenv activate my_env

```
12. Double check to see if pip is being served from pyenv or global python  
```
which pip 
pip --version
```

13. Use the requirement file to load the packages 
```
pip install -r PATH_TO_requirements.txt
```

### Done! You should be ready to go! 

> [!Note]
> If anything goes wrong, just remove PATH_TO_YOUR_DIR and the lines from ~/.bashrc as well as ~/.profile and you'd be back to original.
