#!/bin/bash

if [ ! -e /tmp/puppet-updated ]; then
  rm /etc/apt/sources.list.d/puppetlabs.list
  wget -O /tmp/puppetlabs-release-precise.deb http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i /tmp/puppetlabs-release-precise.deb
  apt-get update
  apt-get --yes install puppet
  touch /tmp/puppet-updated
fi
