#
# Cookbook Name:: ht-hostname
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "hostname" do
  path "/etc/hostname"
  source "hostname.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "resolv.conf" do
  path "/etc/resolv.conf"
  source "resolv.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

