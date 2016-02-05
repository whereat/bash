#Where@ Scripts

This is the entry point to the codebase. Inside this repo are a set of scripts that should get you set up and ready to contribute.

## To clone all repos
1. Clone this repo into your working directory
    - ```git clone git@github.com:whereat/whereat-bash.git```
2. Export necessary environment variables
    - ```cd whereat-bash && export SCRIPTS=`pwd` && export PROJECT_ROOT=../```
3. Run clone-repos.sh to clone entire codebase
    - ```./src/remotes/clone-repos.sh```
4. Generate a gpg key (See https://www.madboa.com/geek/gpg-quickstart/)
5. Copy or write down your gpg key short fingerprint
    - ```gpg -K # Copy the 8 digit id for your public key```
6. Run add-gpg-to-all.sh to set up all repos to sign commits with gpg key.
    - ```KEY=[YOUR_PUBLIC_KEY_SHORT_FINGERPRINT] ./src/git-config/add-gpg-to-all.sh```

## To install a Docker Container for the Location Server

1. Export the following environment variables into your $PATH:
    * `WHAT_ROOT`
      * what it is: project root for all where@ repos
      * eg: `~/my-code/whereat`
    * `WHAT_KEY`
      * what it is: gpg signing key you're using for this project
      * retrievable via `gpg -K`
      * eg: after running `gpg -k`, you should see a line that looks like:
        ```
        sec   2048R/1E4DFE5A 2015-10-06 [expires: 2017-07-19]
        ```
        You want to grab the `1E4DFE5A` and export it with `export KEY=1E4DFE5A`
2. Clone the repo into `$WHAT_ROOT`
   ```
   cd $WHAT_ROOT
   git clone git@github.com:whereat/whereat-bash.git
   ```
3. Export the path to the scripts into your $PATH:
   ```
   cd whereat-bash
   export WHAT_SCRIPTS=`pwd`
   ```
4. Run the script to build the docker container for the location server!
   ```
   ${WHEREAT_SCRIPTS}/src/setup/setup-location-server.sh
   ```
5. This should open a docker container that you can use!!!
   * You should start off in a prompt inside the container
   * You can test whether the server works as follows:
   ```
   cd whereat-location-server
   sbt run
   ```
   * Your local version of the application code is mounted into the container
   * You can edit the code on your local machine and run it inside the container
6. If you're missing environment variables, contact a maintainer via:
   whereat-contrib@lists.riseup.net
