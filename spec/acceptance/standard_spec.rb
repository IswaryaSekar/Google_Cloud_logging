#puppet-gcloudsdk/spec/acceptance/standard_spec.rb
require 'spec_helper_acceptance'

describe 'gclogging class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
	 pp = <<-EOS
        class { 'gclogging':}       
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end
it 'should place the file /tmp/install_logging.sh' do
	  # Check whether the file exists
	  File.exist?('~/tmp/install_logging.sh')
	 end 

	describe file('/tmp/install_logging.sh') do
  its(:content) { should match /fluentd_log/ }
end

describe command('logger --version /') do
  its(:stdout) { should contain /util-linux/ }
end

end
end
