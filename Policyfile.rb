# Policyfile.rb - Describe how you want Chef to configure your pantry-workstation.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

name 'pantry'
# Get cookbooks from supermarket.chef.io
default_source :community

##########
# Run List
# chef-client will run these recipes in the order specified.
# Modify this to include other cookbooks you wish to use, separating
# each recipe name with commas. For example:
#
# run_list(
#   'pantry',
#   'mycookbook'
# )
#
# Add `cookbook` entries for cookbooks that are not found on
# supermarket. See the POLICYFILE_README.md for more information.

cookbook 'homeshick', git: 'https://github.com/chefhippie/homeshick'
cookbook 'packages'
cookbook 'spf13_vim', git: 'https://github.com/xavierdutreilh/chef-spf13-vim'

cookbook 'pantry-workstation', path: 'cookbooks/pantry-workstation'
#cookbook 'pantry-workstation', git: 'https://github.com/apealive-cookbooks/pantry-workstation'

run_list(
  'pantry-workstation',
  'pantry-workstation::users_pair',
  'packages',
  #'spf13_vim',
)

############
# Attributes
# Feel free to modify these values, or add your own attributes for
# other cookbooks.
#
#

default['pantry-workstation']['users'] = ['pmichalec']

default['spf13_vim']['users'] = [
   { 	'username'=> 'pmichalec',
			'groupname'=> 'pmichalec'
   }
]

#
# Specify values as a space separated list of words. For example,
# %w(git go packer tree)
#
# packages for OS X
default['homebrew']['casks']      = %w(
  #flux
  #font-source-code-pro
  #font-source-sans-pro
  #font-source-serif-pro
  #github-desktop
  #grandperspective
  #harvest
  #iterm2-beta
  #java
  #lastfm
  #onyx
  #rust
  #sequel-pro
  #skitch
  #splashtop-personal
  #splashtop-streamer
  #spotify
  #ssh-tunnel-manager
  #teamviewer
  #textual
  #xquartz
  atom
  chefdk
  dockertoolbox
  dropbox
  evernote
  firefox
  google-chrome
  gpgtools
  iterm2
  packer
  python
  pbcopy
  pbpaste
  skype
  slack
  vagrant
  virtualbox
  vlc
)
default['homebrew']['formula']    = %w(
  #PlantUML
  #dffoscope
  #direnv
  #gradle
  #jenv
  #kafkacat
  #mackup
  #node
  #ocaml
  #opam
  #pandoc
  #postgresql
  #python
  #readline
  #slurm
  #sqlite
  #swagger-codegen
  #wakatime-cli
  ack
  curl
  coreutils
  dos2unix
  hugo
  fish
  freetype
  git
  git-extras
  pandoc
  ispell
  jq
  jsonpp
  tmux
  wget
  zsh
  zsh-completions
  ipcalc
  asciinema
  sshuttle

)
default['homebrew']['taps']       = %w(
)


# packages for Windows
default['chocolatey']['packages'] = %w(
)


# NOTE: be aware of has as config: {'git' => 'install', 'openssl' => 'upgrade'}
default['packages-cookbook'] = %w(
  ipcalc
  ack-grep
  byobu
  ca-certificates
  curl
  fish
  git-annex
  git-extras
  network-manager-openvpn-gnome
  npm
  openssh-server
  openvpn
  python-pip
  slack
  ssh-askpass
  tmux
  vagrant
  vim
  virtualbox
  vlc
  wget
  xclip
  zsh
  pandoc
  jq
  python3-sphinx
  qemu-kvm
  virt-manager
  libvirt-bin
  bridge-utils
  virtinst
  aptdcon
  cryptsetup
  gpp
  ipcalc
  luksopen
  openconnect
  putty
  sshuttle
)

# packages from lang package managers
default['pantry-workstation']['lang-packages'] = {

  # keys represents lang to be installed
  #
  # empty value => install packages defined in recipe
  # if any value than install from recipe + the list

  # name:version
  :python => %w(
    codevalidator
    virtualenv
    virtualenvwrapper
    yolk3k
    reclass
    salt
    salt-ssh
    cookiecutter
  ),
    # mu_repo

  # name
  :npm => %w(),

}

# npm
# installs if 'npm' is a key in node['pantry-workstation']['lang-packages']
default['npm_packages']= [
    { :name => 'fisherman' },
    { :name => 'gr' },
]

# external (see recipe pantry-workstation::extr-packages)
default['pantry-workstation']['external-packages'] = %w(authoring saltstack)

## NICE TO HAVE BUT OVER THE REAL NEEDS RIGHT NOW
#
#default['pantry-workstation']['debian-resources'] = {
  #authoring => {
    #repos: ['ppa:neovim-ppa/unstable'],
    #packages: ['neovim']
  #},
  #saltstack => {
    #repos: ['http://repo.saltstack.com/apt/debian/8/amd64/latest'],
    #keys: ['https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub'],
    #packages: [
      #'salt-master',
      #'salt-minion'
    #]
  #}
#}




