require "spec_helper"

describe "docker" do
  describe package("dockertoolbox") do
    it { should be_installed.by("homebrew_cask") }
  end
end
