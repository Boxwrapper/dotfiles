#!/bin/zsh

# Copyright 2020 - Samuel Oechsler
# Installs packes from yarn package manager

install_yarn() {
    write_line ${GREEN} "Installing ${GREEN}yarn${RBOLD}."

    # Relink yarn symlinks
    brew unlink yarn
    rm /usr/local/bin/yarn
    brew link --overwrite yarn

    if [[ $(command_exists yarn -v) -ne 0 ]]; then
        write_line ${RED} "Dependency ${RED}yarn${RBOLD} not found."
        return 1
    fi

    yarn_list=./packages/${env:-default}_yarn.list
    if [[ $debug == true ]]; then
        write_line ${BLUE} "Found install packages:"

        echo "yarn: $(read_list $yarn_list)"
    else
        # Install packages specefied in yarn.list
        if [[ -e $yarn_list ]]; then
            yarn global add $(read_list $yarn_list)
        else
            write_line ${RED} "Missing ${RED}$yarn_list${RBOLD} package list."
            return 1
        fi
    fi

    write_line ${GREEN} "Installed ${GREEN}yarn${RBOLD}."
}

update_yarn() {
    write_line ${GREEN} "Updating ${GREEN}yarn${RBOLD}."

    # Relink yarn symlinks
    brew unlink yarn
    rm /usr/local/bin/yarn
    brew link --overwrite yarn

    # Run yarn update command
    yarn global upgrade

    write_line ${GREEN} "Updated ${GREEN}yarn${RBOLD}."
}
