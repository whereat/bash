# Where@ Scripts

This is the entry point to the codebase. Inside this repo are a set of scripts that should get you set up and ready to contribute.

## To set up GPG

Motivation: GPG (GNU Privacy Guard) is an implementation of public-private key encryption. This project currently uses GPG to sign commits to verify the identity of contributors and is exploring using it for credentials management.

1. Install GPG
  - `brew install gpg` on Mac, or use your favorite package manager on Linux if not already present
1. Generate a GPG key (for more information, see https://www.madboa.com/geek/gpg-quickstart/)
  - `gpg --gen-key`
  - Remember your passphrase!

## To clone all repos

1. Export the following environment variables in your ~/.bashrc:
    * `WHEREAT_KEY`: the GPG signing key you're using for this project. To find it:
      1. Run `gpg -K`
      2. You should see a line that looks like:
        ```
        sec   2048R/1E4DFE5A 2015-10-06 [expires: 2017-07-19]
        ```
        `1E4DFE5A` is the value of `WHEREAT_KEY` to export
    * `WHEREAT_ROOT`: the project root for all where@ repos (e.g., `~/my-code/whereat`)
1. Source the file where you put your environment variables
  - e.g., `source ~/.bashrc`
1. Clone the scripts repo into `$WHEREAT_ROOT`
   ```
   cd $WHEREAT_ROOT
   git clone git@github.com:whereat/whereat-bash.git
   ```
1. Add a `WHEREAT_SCRIPTS` environment variable to your .bashrc and source again:
   ```
   cd whereat-bash
   echo "export WHEREAT_SCRIPTS=`pwd`" >> ~/.bashrc
   source ~/.bashrc
   ```
1. Run clone-repos.sh to clone entire codebase
    - `./src/remotes/clone-repos.sh`
1. Run add-gpg-to-all.sh to set up all repos to sign commits with gpg key.
    - `./src/git-config/add-gpg-to-all.sh`

## To install a Docker Container for the Location Server

1. Get the rest of the environment variables from a project admin (email whereat-contrib@lists.riseup.net)
1. Add the environment variables to a .env file in `$WHEREAT_ROOT/whereat-location-server`
1. Set up the Docker environment
  - Linux: start the Docker daemon
  - Mac:
    1. Set up a default Docker machine
      - Run `docker-machine create --driver virtualbox default`
    1. Set up the Docker environment
      - Run `eval "$(docker-machine env default)"`
1. Run the script to build the docker container for the location server
   ```
   ${WHEREAT_SCRIPTS}/src/setup/setup-location-server.sh
   ```
1. This should open a docker container that you can use!!!
   * You should start off in a prompt inside the container
   * You can test whether the server works as follows:
   ```
   cd whereat-location-server
   sbt run
   ```
   * Your local version of the application code is mounted into the container
   * You can edit the code on your local machine and run it inside the container
