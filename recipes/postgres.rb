#
# Cookbook:: app-box-cookbook
# Recipe:: postgres
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

postgresql_server_install 'Postgresql Server' do
  version node['app-box']['postgres_version']
  action :install
end

postgresql_server_install 'Postgresql Server' do
  password 'PgP4ssw0d'
  port 5432
  action :create
end

postgresql_server_conf 'PostgreSQL Config Replacement' do
  version node['app-box']['postgres_version'] # REQUIRED, or defaults to 9.6 despite mismatching postgresql_server_install
  notification :restart
end

postgresql_user 'app-user' do
  password 'UserP4ssword'
  createdb true
end

postgresql_database 'app' do
  owner 'app-user'
end

postgresql_access 'app user access' do
  comment 'app user access'
  access_type 'host'
  access_db 'app'
  access_user 'app-user'
  access_addr '0.0.0.0/0'
  access_method 'md5'
end
