#
# Cookbook Name:: network-interfaces
# Recipe:: default
#
# Copyright 2013, FER
#
# All rights reserved - Do Not Redistribute
#

template "/etc/network/interfaces-ipv6-chef" do
  source "interfaces-ipv6-chef.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
  	:interfaces => node[:interface_list]
  )
end
