#
# Cookbook Name:: helloweb
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'helloweb::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'downloads the web content tarball' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/webfiles.tar.gz")
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates index.html' do
      expect(chef_run).to render_file('/var/www/html/index.html')
    end
  end
end
