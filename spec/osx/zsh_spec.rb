require "spec_helper"

describe "zsh" do
  describe package("zsh") do
    it { should be_installed }
  end

  describe file("#{Dir.home}/.zsh.d/.git") do
    it { should be_directory }
  end

  %w(
  .zshrc
  .zshenv
  .zlogin
  ).each do |z|
    describe file("#{Dir.home}/#{z}") do
      it { should be_file }
    end
  end
end
