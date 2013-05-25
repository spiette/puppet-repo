require 'spec_helper'

describe 'repo' do
  osfamily = 'RedHat'
  let(:title) { 'epel' }
  let(:facts) { { :osfamily => osfamily } }

  context "repo define with keyname" do 
    let(:params) {{
      :keyname => 'EPEL-6'
    }}
    it { should create_repo('epel') }
    it { should create_file('/etc/yum.repos.d/epel.repo')\
      .with_source('puppet:///modules/repo/epel/epel.repo') }

    it { should create_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6')\
      .with_source('puppet:///modules/repo/epel/RPM-GPG-KEY-EPEL-6') }
  end
  context "repo define with keyname and module params" do 
    let(:params) {{
      :module => 'foobar',
      :keyname => 'EPEL-6'
    }}
    it { should create_repo('epel') }
    it { should create_file('/etc/yum.repos.d/epel.repo')\
      .with_source('puppet:///modules/foobar/epel/epel.repo') }

    it { should create_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6')\
      .with_source('puppet:///modules/foobar/epel/RPM-GPG-KEY-EPEL-6') }
  end
end
