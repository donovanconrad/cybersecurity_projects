#!/bin/bash

# This script will install Google Chrome and the Cookie-Editor extension

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install Chrome extensions function
install_chrome_extension () {
  preferences_dir_path="/opt/google/chrome/extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

# if ! which "google-chrome" ; then
#   wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
#   | sudo apt-key add -
#   echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
#   | sudo tee /etc/apt/sources.list.d/google-chrome.list
#   sudo apt-get update
#   sudo apt install google-chrome-stable
# else
#   echo Chrome already installed
# fi

# Extension positionals for function (first is from ext.  URL, second is ext. name)
# install_chrome_extension "cfhdojbkjhnklbpkdaibdccddilifddb" "Adblock Plus"
install_chrome_extension "hlkenndednhfkekhgcdicdfddnkalmdm" "Cookie-Editor"
# install_chrome_extension "pgjjikdiikihdfpoppgaidccahalehjh" "Speedtest by Ookla"