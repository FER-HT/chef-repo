#
# Cookbook Name:: postgresql
# Recipe:: contrib
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

include_recipe "postgresql::server"

# Install the PostgreSQL contrib package(s) from the distribution,
# as specified by the node attributes.
node['postgresql']['contrib']['packages'].each do |pg_pack|

  package pg_pack

end

# Install PostgreSQL contrib extentions into the template1 database,
# as specified by the node attributes.
if (node['postgresql']['contrib'].attribute?('extensions'))
  node['postgresql']['contrib']['extensions'].each do |pg_ext|
    execute "#{pg_ext} extension on template1" do
      command <<-EOC
        sudo -u postgres psql -d template1 -c "CREATE EXTENSION IF NOT EXISTS #{pg_ext}";
      EOC
      action :run
    end
  end
end
