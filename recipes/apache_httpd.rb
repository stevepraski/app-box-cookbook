#
# Cookbook:: app-box-cookbook
# Recipe:: apache_httpd
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

# FIXME: make common code

case node['platform_family']
when 'debian'
  package 'apache2'

  directory node['app-box']['httpd']['doc_root'] do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
  end

  # FIXME: restrict .htaccess overrides
  template 'httpd-conf' do
    path '/etc/apache2/apache.conf'
    source 'httpd.conf.erb'
    mode '0400'
    owner 'root'
    group 'root'
    variables src_root: node['app-box']['httpd']['src_root'],
              doc_root: node['app-box']['httpd']['doc_root'],
              admin_email: node['app-box']['httpd']['admin_email'],
              server_name: node['app-box']['httpd']['server_name'],
              listen_port: node['app-box']['httpd']['listen_port']
    action :create
    notifies :restart, 'service[apache2]', :delayed
  end

  service 'apache2' do
    action [:enable, :start]
  end

when 'rhel', 'chefspec'
  package 'httpd'

  directory node['app-box']['httpd']['doc_root'] do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
  end

  # FIXME: restrict .htaccess overrides
  template 'httpd-conf' do
    path '/etc/httpd/conf/httpd.conf'
    source 'httpd.conf.erb'
    mode '0400'
    owner 'root'
    group 'root'
    variables src_root: node['app-box']['httpd']['src_root'],
              doc_root: node['app-box']['httpd']['doc_root'],
              admin_email: node['app-box']['httpd']['admin_email'],
              server_name: node['app-box']['httpd']['server_name'],
              listen_port: node['app-box']['httpd']['listen_port']
    action :create
    notifies :restart, 'service[httpd]', :delayed
  end

  service 'httpd' do
    action [:enable, :start]
  end

else
  raise "Unsupported Platform Family: #{node['platform_family']}"
end
