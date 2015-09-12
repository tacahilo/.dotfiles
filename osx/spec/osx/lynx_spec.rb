require "spec_helper"

describe "lynx" do
  describe package("lynx") do
    it { should be_installed }
  end

  describe file("#{Dir.home}/.lynx.lss") do
    it { should be_file }
  end
end
