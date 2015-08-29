require "spec_helper"

describe "vim" do
  describe package("vim") do
    it { should be_installed }
  end

  describe file("~/.vim/.git") do
    it { should be_directory }
  end
end
