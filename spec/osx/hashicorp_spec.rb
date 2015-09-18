require "spec_helper"

describe "hashicorp" do
  describe package("virtualbox") do
    it { should be_installed.by("homebrew_cask") }
  end

  describe package("vagrant") do
    it { should be_installed.by("homebrew_cask") }
  end

  describe package("terraform") do
    it { should be_installed }
  end
end
