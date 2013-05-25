# repo

This is the repo module for yum repositories. Copy the repo and key files
under a module files directory, eg.:

files/epel/epel.repo
files/epel/RPM-GPG-KEY-EPEL-6

And use like this:

    repo { 'epel':
      keyname => 'EPEL-6'
    }

This will look for files under the repo module. The idea is to simplify the
task to add a repo. Drop the files in a module, call the repo define.

# License
Apache 2.0

# Contact

Simon Piette <piette.simon@gmail.com>

# Support

Please log tickets and issues at our [Projects site](https://github.com/spiette/puppet-repo)
