require 'spec_helper'

describe 'home' do
  describe file("#{Dir.home}/bin") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/src") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/usr/local/bin") do
    it { should be_directory }
  end
end
