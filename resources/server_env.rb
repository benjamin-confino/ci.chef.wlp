# Cookbook Name:: wlp
# Attributes:: default
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

=begin
#<
Sets and unsets environment properties in installation-wide or instance-specific server.env file.

@action set   Sets environment properties in server.env file.
@action unset Unsets environment properties in server.env file.

@section Examples
```ruby
wlp_server_env "set in instance-specific server.env" do
  server_name "myInstance"
  properties "JAVA_HOME" => "/usr/lib/j2sdk1.7-ibm/"
  action :set
end

wlp_server_env "unset in instance-specific server.env" do
  server_name "myInstance"
  properties [ "JAVA_HOME" ]
  action :unset
end

wlp_server_env "set in installation-wide server.env" do
  properties "WLP_USER_DIR" => "/var/wlp"
  action :set
end

wlp_server_env "unset in installation-wide server.env" do
  properties [ "WLP_USER_DIR" ]
  action :unset
end
```
#>
=end
actions :set, :unset

#<> @attribute server_name If specified, the server.env file in the specified server instance is updated. Otherwise, the installation-wide server.env file is updated.
attribute :server_name, :kind_of => String, :default => nil

#<> @attribute properties The properties to set or unset. Must be specified as a hash when setting and as an array when unsetting.
attribute :properties, :kind_of => [Hash, Array], :default => nil

default_action :set

