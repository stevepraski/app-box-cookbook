#
# Cookbook:: app-box-cookbook
# Recipe:: php
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

include_recipe 'yum-ius::default'

php_version = node['app-box']['php_version']
php_version_squish = php_version.split('.').join
ius_php_package = 'php' + php_version_squish + 'u'

package ius_php_package
