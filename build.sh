#! /bin/bash
vagrant ssh -c "export LC_ALL=sv_SE.UTF-8; cd /vagrant; mix local.hex --force; yes | mix deps.get; MIX_ENV=prod mix release"
