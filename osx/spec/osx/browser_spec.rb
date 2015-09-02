require "spec_helper"

describe "browser" do
  %w(
    google-chrome
    firefox
    opera
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed.by("homebrew_cask") }
    end
  end
end
