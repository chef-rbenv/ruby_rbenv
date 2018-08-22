# frozen_string_literal: true
global_ruby = '2.3.4'

control 'Rbenv should be installed' do
  title 'Rbenv should be installed globally'

  desc "Can set global Ruby version to #{global_ruby}"
  describe bash('source /etc/profile.d/rbenv.sh && rbenv versions --bare') do
    its('exit_status') { should eq 0 }
    its('stdout') { should include(global_ruby) }
  end
end

control 'Rbenv should be to the system path' do
  title 'Rbenv should be install in the system wide location'

  describe file('/usr/local/rbenv') do
    it { should exist }
    it { should be_directory }
  end
end
