# CondaToMiniforge3
## Guidelines for migrating a conda environment to miniforge3

1. **Activate** your conda environment as usual. Note the exact python version the environment is using.
2. Run `mkdir conda_requirements && cd conda_requirements`
3. Copy conda_req_envs.sh here and set permissions: `chmod +x conda_req_envs.sh`
4. Run `source ./conda_req_envs.sh`
5. Download Miniforge3:

   `curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"`

6. By default, Miniforge3 installs into ~/miniforge3. I do not recommend this because this would fill up that home dir. Rather install into your work machine:

      `bash Miniforge3-$(uname)-$(uname -m).sh -p /vol/aibn_yourmachine/data1/your_username/opt/miniforge3`
   Replace `aibn_yourmachine/data1/your_username/` with the appropriate path. Ensure that miniforge3 dir does not already exist.
   Go ahead and install and accept the Licenses.
7. Run `micromamba activate` as suggested by the installer. Set `conda config --set auto_activate_base false` in .bashrc to stop auto-activating base env. Remember to do `source .bashrc`.
8. If installation is successful, run:
   ```
   chmod +x create_conda_env.sh
   source ./create_conda_env.sh yourfile_requirements.txt`
   ```

   Replace yourfile_requirements.txt with the requirements file that was created for the corresponding env. Repeat step 8 for all other required env creation.



### Done! You should be ready to go! 

> [!Note]
> If anything goes wrong, well ... Good Luck! (Don't worry, it won't)
