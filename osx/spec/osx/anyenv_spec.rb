require "spec_helper"

describe "anyenv" do
  describe file("#{Dir.home}/.anyenv/.git") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/.anyenv/plugins") do
    it { should be_directory }
  end

  describe file("#{Dir.home}/.anyenv/plugins/anyenv-update/.git") do
    it { should be_directory }
  end

  %w(
    goenv
    plenv
    pyenv
    rbenv
    exenv
  ).each do |env|
    describe file("#{Dir.home}/.anyenv/envs/#{env}") do
      it { should be_directory }
    end
  end
end
