# == Class: repo
#
# Create a repository file with existing files and keys.
# GPG keys are not supplementary.
#
# === Parameters
#
# Document parameters here.
#
# [*source*]
#   Speficy a file to put on /etc/yum.repos.d. Defaults to
#   "puppet:///modules/repo/${name}/${name}.repo".
#
# [*keyname*]
#   Specify the last part of the key to use. It will be prefixed by
#   "RPM-GPG-KEY-"
#
# [*module*]
#   In which module files directory to look for source and keys
#   Defaults to repo
#
# === Examples
#
#  repo { 'epel':
#    keyname => 'EPEL-6'
#  }
#
#
# === Authors
#
# Simon Piette <piette.simon@gmail.com>
#
# === Copyright
#
# Copyright 2013 Simon Piette
#
define repo (
  $module = $module_name,
  $source = undef,
  $keyname = $name,
  ) {
  if ! $source {
    $reposource = "puppet:///modules/${module}/${name}/${name}.repo"
  }
  file { "/etc/yum.repos.d/${name}.repo":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => $reposource,
  }
  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-${keyname}":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => "puppet:///modules/${module}/${name}/RPM-GPG-KEY-${keyname}",
  }
}
