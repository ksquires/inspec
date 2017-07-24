control "cis-1-1-1" do
  impact 1.0
  title "Ensure mounting of cramfs filesystems is disabled (Scored)"
  desc "The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the
image."
  describe command('modprobe -n -v cramfs') do
    its('stdout') { should match (/install \/bin\/true/) }
  end
  describe command('lsmod | grep cramfs') do
    its('stdout') { should match (//) }
  end
end
control "cis-1-2-2" do
  impact 1.0
  title "Ensure GPG keys are configured (Not Scored)"
  desc "Most packages managers implement GPG key signing to verify package integrity during installation"
  describe command('rpm -q gpg-pubkey --qf "%{name}-%{version}-%{release} --> %{summary}\n"') do
    its('stdout') { should match (/CentOS 7 Official Signing Key/) }
  end
end
