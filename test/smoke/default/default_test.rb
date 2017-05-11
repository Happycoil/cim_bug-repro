# # encoding: utf-8

# Inspec test for recipe cim_bug_repro::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

posh_git_instaled = <<-EOH
  [bool](Get-Module -Name posh-git -ListAvailable)
EOH

describe powershell(posh_git_instaled) do
  its('strip') { should eq 'True' }
end
