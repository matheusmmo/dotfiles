#!/bin/bash
# Fedora-only stuff. Abort if not Fedora.
is_fedora || return 1

sudo dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/folkswithhats-release.noarch.rpm 

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

sudo dnf install fedy 