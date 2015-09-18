require "spec_helper"

describe "android" do
  %w(
    java
    android-studio
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed.by("homebrew_cask") }
    end
  end
end
