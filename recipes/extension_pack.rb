#
# Cookbook Name:: virtualbox
# Recipe:: extension_pack
#
# Copyright 2011-2013, Ian Blenke
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

remote_file node['virtualbox']['extpack_file'] do
  source node['virtualbox']['extpack_url']
  checksum vbox_sha256sum(node['virtualbox']['extpack_url'])
end

bash "install virtualbox extpack if not already installed" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  VBoxManage list extpacks >> /tmp/virtualbox_extpack_install.$$
  if ! grep 'Oracle VM VirtualBox Extension Pack' /tmp/virtualbox_extpack_install.$$ > /dev/null 2>&1; then
    VBoxManage extpack install #{node['virtualbox']['extpack_file']}
  fi
  EOH
end

