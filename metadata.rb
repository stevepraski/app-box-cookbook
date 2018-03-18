name 'app-box-cookbook'
maintainer 'Steven Praski'
maintainer_email 'stevepraski@users.noreply.github.com'
license 'Apache-2.0'
source_url 'https://github.com/stevepraski/app-box-cookbook'
issues_url 'https://github.com/stevepraski/app-box-cookbook/issues'
description 'Installs/Configures app-box-cookbook'
long_description 'Installs/Configures app-box-cookbook'
chef_version '>= 13.2.20' if respond_to?(:chef_version)
supports 'centos'
supports 'ubuntu', '= 16.04'
version '0.1.2'

depends 'apt', '~> 6.1'
depends 'yum-ius'
depends 'postgresql' # 7.x not released for supermarket yet, so over-ride in Berksfile
