control "cis-1-2-2" do
  impact 1.0
  title "Ensure GPG keys are configured (Not Scored)"
  desc "Most packages managers implement GPG key signing to verify package integrity during installation"
  describe command('rpm -q gpg-pubkey --qf "%{name}-%{version}-%{release} --> %{summary}\n"') do
    its('stdout') { should match (/CentOS 7 Official Signing Key/) }
  end
end
