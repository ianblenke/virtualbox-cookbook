#
# Cookbook Name:: virtualbox
# Attributes:: default
#
# Copyright 2011, Joshua Timberman
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
#


default['virtualbox']['url'] = ''
default['virtualbox']['version'] = ''

case node['platform_family']
when 'mac_os_x'
  default['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/4.2.18/VirtualBox-4.2.18-88780-OSX.dmg'
when 'windows'
  default['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/4.2.18/VirtualBox-4.2.18-88780-Win.exe'
  default['virtualbox']['version'] = Vbox::Helpers.vbox_version(node['virtualbox']['url'])
when 'debian', 'rhel'
  default['virtualbox']['version'] = '4.2'
end

default['virtualbox']['extpack_url'] = 'http://download.virtualbox.org/virtualbox/4.2.18/Oracle_VM_VirtualBox_Extension_Pack-4.2.18.vbox-extpack'
default['virtualbox']['extpack_file'] = "#{Chef::Config[:file_cache_path]}/#{::File.basename(::URI.parse(node['virtualbox']['extpack_url']).path)}"

