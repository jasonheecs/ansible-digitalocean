require_relative 'spec_helper'

describe file('/tmp/kitchen/hosts') do
    it { should be_file }
    its(:content) { should include "[do_droplets]" }
    its(:content) { should include "123.255.123.255" }
end