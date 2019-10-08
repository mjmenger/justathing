# copyright: 2018, The Authors

title "Verify Ansible container setup"

# you add controls here
control "Tools" do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "Verify that the necessary tools are available"             # A human-readable title
  desc "An optional description..."
  # Ansible 2.8 or greater is available
  describe package('ansible') do
    it { should be_installed }
    its('version') { should cmp >= '2.8' }
  end
end

control "Connectivity" do
    impact 1.0
    title "Verify that all requisite connectivity is available"

    describe host('10.1.20.71', port: 6443, protocol: 'tcp') do
        it { should be_reachable }
    end
end 
