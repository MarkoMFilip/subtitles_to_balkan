#!/bin/bash

# sysinfo_page - sets up the environment to run subs_to_balkan script


#### Functions

#######################################
# Checks if a Python module is present in the system.
# Arguments:
#   name of the Python module to be checked.
#######################################
check_py_module () {
  module_present=$( python3 -c "import sys; print('$1' in sys.modules)" )
  if [ $module_present == "False" ]; then
    echo "Python module '$1' not present, instaling..."
    pip install $1
  fi
}  # end check_py_module



#### Main

# Install missing Python modules
check_py_module chardet
check_py_module codecs

# Make the main script executable
chmod +x subs_to_balkan
chmod +x subs_to_balkan.py

# Check if the $HOME/bin folder exists, and if not, create it
if [ ! -d "$HOME/bin" ]; then 
  echo "$HOME/bin doesn't exist, creating..."
  mkdir $HOME/bin
fi

# Move the scripts to $HOME/bin
if [ $(pwd) != "$HOME/bin" ]; then
  echo "Moving scripts to $HOME/bin..."
  mv subs_to_balkan $HOME/bin/subs_to_balkan
  mv subs_to_balkan.py $HOME/bin/subs_to_balkan.py
fi

# Put $HOME/bin on the user path so that the script can be called from anywhere
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  echo "Adding $HOME/bin to the PATH..."
  echo "$a# Convert_subtitles script" >> ~/.bashrc
  # anything inside SINGLE quotes DOES NOT get evaluated!
  echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
  echo "$a" >> ~/.bashrc
  source ~/.bashrc
fi

echo "All done and ready to go."

