require "spec_helper"

describe "vim" do
  describe package("vim") do
    it { should be_installed }
  end

  describe package("ctags") do
    it { should be_installed }
  end

  describe file("#{Dir.home}/.vim/.git") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/.vim/bundle/neobundle.vim") do
    it { should be_directory }
  end
end
