#
# Cookbook Name:: helloweb
# Recipe:: audit_apache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

control_group 'Validate apache configuration' do
  control 'Ensure directory listing is not allowed' do
    it 'does not allow directory listing' do
      expect(file('/etc/httpd/conf/httpd.conf').content).to_not match(/Options Indexes/)
    end
  end
end
