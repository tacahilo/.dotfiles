#!/bin/sh

if [ -f ~/.plenv/bin/plenv ]; then
  echo plenv already exists
  exit 1
fi

cat <<'EOF'

  _____           _        _ _ _             
  \_   \_ __  ___| |_ __ _| | (_)_ __   __ _ 
   / /\/ '_ \/ __| __/ _` | | | | '_ \ / _` |
/\/ /_ | | | \__ \ || (_| | | | | | | | (_| |
\____/ |_| |_|___/\__\__,_|_|_|_|_| |_|\__, |
                                       |___/ 
       _                                     
 _ __ | | ___ _ ____   __                    
| '_ \| |/ _ \ '_ \ \ / /                    
| |_) | |  __/ | | \ V / _ _                 
| .__/|_|\___|_| |_|\_(_|_|_)                
|_|                                          

EOF


git clone git://github.com/tokuhirom/plenv.git ~/.plenv
mkdir -p ~/.plenv/plugins
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build
git clone git://github.com/Tacahilo/plenv-update.git ~/.plenv/plugins/plenv-update


cat <<'EOF'

         ___  ___    __  __      
__/\__  /   \/___\/\ \ \/__\_/\__
\    / / /\ //  //  \/ /_\ \    /
/_  _\/ /_// \_// /\  //__ /_  _\
  \/ /___,'\___/\_\ \/\__/   \/  
                                 

EOF
