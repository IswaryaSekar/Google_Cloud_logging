require 'spec_helper'
describe 'gclogging' do

	it { should contain_class('gclogging') }

	it do
	    is_expected.to contain_file('/tmp/install_logging.sh').with({
 		 'ensure' => 'present',
   		 'mode'   => '0644'
	    })
	end

	it do should contain_exec('Install Logging Agent').with(
	        'command'   => 'bash /tmp/install_logging.sh',
        ) end

	it do
	    is_expected.to contain_file('/tmp/agent.sh').with({
		'ensure'  => 'present',
		'mode'    => '0755',
	    })
	end

	it do should contain_exec('Agent').with(
	        'command'   => 'sh /tmp/agent.sh',
        ) end


end


