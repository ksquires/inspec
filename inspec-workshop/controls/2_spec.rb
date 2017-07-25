control "cis-1-2-3" do
  impact 1.0
  title "forgot what this was"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf and individual
/etc/yum/repos.d/* files determines if an RPM package's signature is checked prior to its
installation."
  describe file('/etc/yum.conf') do
    its('content') { should match (/gpgcheck=1/) }
  end
end
