build
=====

Simple build environment for pki.io

Requirements
============

At the moment it is focused on Vagrant, but we'll be adding Docker support soon.

Vagrant Boxes
=====

https://github.com/opscode/bento

Using it
=======

Install vagrant from https://www.vagrantup.com/

Clone and run the vagrant builds.

    $ git clone https://github.com/pki-io/build.git
    $ cd build
    $ ./vagrant_all.sh
    $ ls builds/

You should see the built packages.
