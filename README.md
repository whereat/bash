# Where@ Scripts

This is the entry point to the codebase. Inside this repo are a set of scripts that should get you set up and ready to contribute.

## To set up GPG

Motivation: GPG (GNU Privacy Guard) is an implementation of public-private key encryption. This project currently uses GPG to sign commits to verify the identity of contributors and is exploring using it for credentials management.

1. Check if GPG is installed
    `$ which gpg`
1. Install GPG (if needed)
  - **MAC USERS** `$ brew install gpg`
  - **LINUX USERS** use your favorite package manager on Linux to install gpg
  - You might also enjoy the silky smooth UX of [GPG Tools](https://gpgtools.org/)
1. Check if you have a PGP Key
  
   `$ gpg -K`

   If you see an entry with your email address: YAY! You have a PGP key. You can skip the following step.
1. Generate a GPG key (for more information, see https://www.madboa.com/geek/gpg-quickstart/)
  - `$ gpg --gen-key`
  - when asked which type of key you want, choose option `(1) [RSA/DSA]`
  - when asked how many bits you would like, we recommend 4096
  - __Remember your passphrase!__ (NO REALLY! If you forget this, it's REALLY SAD!)

## To clone all repos

1. Open the file located at `~/.bashrc` and insert the following lines:
   
   ```
   export WHEREAT_KEY=<YOUR_PGP_KEY_ID>
   export WHEREAT_ROOT=<PATH_TO_YOUR_WHERAT_REPOS>
   ```
    Replace the text in angle brackets as follows:
   * To find `<YOUR_PGP_KEY_ID>`:
      1. Run `gpg -K`
      1. You should see a line that looks like:

        ```
        sec   2048R/1E4DFE5A 2015-10-06 [expires: 2017-07-19]
        ```

        `1E4DFE5A` is your PGP key
    * To find `<PATH_TO_YOUR_WHERAT_REPOS>`:
      1. `cd` into the directory in which you are keeping where@ repos
      1. issue the following command: `pwd`
      1. this should print out the full path to the directory, for example:
         `/home/awesomecontributor/code/whereat/`
    * Given the above examples, we would add the following lines to `~/.bashrc`:

      ```
      export WHEREAT_KEY=1E4DFE5A
      export WHEREAT_ROOT=/home/awesomecontributor/code/whereat/
      ```
1. Source the file where you put your environment variables
   
  `$ source ~/.bashrc`
1. Clone the scripts repo into `$WHEREAT_ROOT`
  
   ```
   $ cd $WHEREAT_ROOT
   $ git clone git@github.com:whereat/whereat-bash.git
   ```
1. Add a `WHEREAT_SCRIPTS` environment variable to your .bashrc and source again

   ```
   $ cd whereat-bash
   $ echo "export WHEREAT_SCRIPTS=`pwd`" >> ~/.bashrc
   $ source ~/.bashrc
   ```
1. Run clone-repos.sh to clone entire codebase
  
  `$ ./src/remotes/clone-repos.sh`
1. Run add-gpg-to-all.sh to set up all repos to sign commits with gpg key.
    
  `$ ./src/git-config/add-gpg-to-all.sh`

## To install a Docker Container for the Location Server

1. Get the rest of the environment variables from a project admin (email whereat-contrib@lists.riseup.net)
1. Add the environment variables to a .env file in `$WHEREAT_ROOT/whereat-location-server`
1. Set up the Docker environment
  - Linux: start the Docker daemon
    1. If this doesn't work, try installing docker-toolbox at https://docs.docker.com/engine/installation/linux/
  - Mac:
    1. Download and install docker-toolbox from https://www.docker.com/products/docker-toolbox
    1. Set up a default Docker machine
      
      `$ docker-machine create --driver virtualbox default`
    1. Set up the Docker environment
      
      `$ eval "$(docker-machine env default)"`
1. **MAC USERS ONLY** To configure port forwarding from the linux vm to your mac machine
    
    `$ VBoxManage modifyvm "default" --natpf1 "whereat,tcp,,5000,,5000”`
1. Build the docker container for the location server:

   `$ ${WHEREAT_SCRIPTS}/src/docker/connect-to-location-server.sh`
1. This should open a docker container that you can use!!!
   * You should start off in a prompt inside the container
   * You can test whether the server works by running the following:
   ```
   $ cd whereat-location-server
   $ sbt run
   ```
   * Now, Your local version of the application code is mounted into the container
   * You can edit the code on your local machine and run it inside the container
