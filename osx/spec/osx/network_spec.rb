require "spec_helper"

describe "network" do
  %w(
    fping
    hping
    httpie
    curl
    wget
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
