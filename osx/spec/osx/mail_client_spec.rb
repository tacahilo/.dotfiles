require 'spec_helper'

describe 'mail client' do
  %w(
    mutt
    fetchmail
    msmtp
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  describe file("#{Dir.home}/mail") do
    it { should be_directory }
    it { should be_mode 700 }
  end

  describe file("#{Dir.home}/.mutt") do
    it { should be_directory }
    it { should be_mode 700 }
  end

  describe file("#{Dir.home}/.mutt/muttrc") do
    it { should be_file }
    it { should be_mode 600 }
  end

  describe file("#{Dir.home}/.msmtp") do
    it { should be_file }
    it { should be_mode 600 }
  end

  describe file("#{Dir.home}/.fetchmailrc") do
    it { should be_file }
    it { should be_mode 600 }
  end
end
