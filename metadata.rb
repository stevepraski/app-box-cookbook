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
version '0.1.0'

depends 'yum-ius'
