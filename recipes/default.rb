#
# Cookbook:: cim_bug_repro
# Recipe:: default
#
# Copyright:: 2017, TM, All Rights Reserved.

powershell_script 'install packagemanagement' do
  code <<-EOH
    Install-Module -Name PackageManagement -RequiredVersion 1.1.3.0 -Force
  EOH
  not_if "Test-Path -Path '#{ENV['PROGRAMW6432']}\\WindowsPowerShell\\Modules\\PackageManagement\\1.1.3.0'"
end

dsc_resource 'install some module' do
  module_name 'packagemanagement'
  module_version '1.1.3.0'
  resource :packagemanagement
  property :name, 'posh-git'
  property :ensure, 'present'
  property :source, 'psgallery'
  property :additionalparameters, cim_instance_array('MSFT_KeyValuePair', key: 'allowclobber', value: true)
end
