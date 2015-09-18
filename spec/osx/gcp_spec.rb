require "spec_helper"

describe "gcp" do
  describe package('google-cloud-sdk') do
    it { should be_installed.by("homebrew_cask") }
  end
end
