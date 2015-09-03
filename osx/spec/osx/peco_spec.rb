require "spec_helper"

describe "peco" do
  describe package("peco") do
    it { should be_installed }
  end

  describe file("#{Dir.home}/.config/peco") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/.config/peco/config.json") do
    it { should be_file }
  end
end
