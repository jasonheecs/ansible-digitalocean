require_relative 'spec_helper'

describe package('python-pip'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('python2-pip'), :if => os[:family] == 'centos' do
  it { should be_installed }
end

describe package('six') do
  it { should be_installed.by('pip') }
end

describe package('dopy') do
  it { should be_installed.by('pip').with_version('0.3.5') }
end