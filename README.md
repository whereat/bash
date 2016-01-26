#Where@ Scripts

This is the entry point to the codebase. Inside this repo are a set of scripts that should get you set up and ready to contribute.

##Set Up:
1. Clone this repo into your working directory 
    git clone git@github.com:whereat/whereat-bash.git
2. Export necessary environment variables
    cd whereat-bash && export SCRIPTS=`pwd` && export PROJECT_ROOT=../
3. Run clone-repos.sh to clone entire codebase
    ./src/remotes/clone-repos.sh
4. Generate a gpg key (See https://www.madboa.com/geek/gpg-quickstart/)
5. Copy or write down your gpg key short fingerprint
    gpg -K # Copy the 8 digit id for your public key
6. Run add-gpg-to-all.sh to set up all repos to sign commits with gpg key.
    KEY=[YOUR_PUBLIC_KEY_SHORT_FINGERPRINT] ./src/git-config/add-gpg-to-all.sh