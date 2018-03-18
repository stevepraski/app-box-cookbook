#
# Cookbook:: app-box-cookbook
# Recipe:: php_demo
#
# Copyright:: 2018, Steven Praski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'app-box-cookbook::php'
include_recipe 'app-box-cookbook::apache_httpd'

node['app-box']['php_extras'].each do |pkg|
  package pkg
end

template 'config.ini' do
  path ::File.join(node['app-box']['httpd']['src_root'], 'config.ini')
  source 'php_config.ini.erb'
  mode '0400'
  owner 'www-data'
  group 'www-data'
  action :create
  variables server: node['app-box']['db']['server'],
            username: node['app-box']['db']['user_name'],
            password: node['app-box']['db']['user_password'],
            dbname: node['app-box']['db']['db_name']
end

cookbook_file ::File.join(node['app-box']['httpd']['doc_root'], 'index.php') do
  source 'guests.php'
  mode '0400'
  owner 'www-data'
  group 'www-data'
  action :create
end

file ::File.join(node['app-box']['httpd']['doc_root'], 'index.html') do
  action :delete
end
