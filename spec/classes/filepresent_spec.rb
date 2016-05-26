require 'spec_helper'
#require_relative '../manifests/sample.rb'
describe 'contains install_logging' do
it { File.exist?('Mymodule/install_logging/manifests/init.pp') }
end
at_exit { RSpec::Puppet::Coverage.report! }
