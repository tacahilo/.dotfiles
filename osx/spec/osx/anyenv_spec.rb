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

  %w(
    gem-src
    rbenv-gem-rehash
    rbenv-default-gems
  ).each do |plugin|
    describe file("#{Dir.home}/.anyenv/envs/rbenv/plugins/#{plugin}/.git") do
      it { should be_directory }
    end
  end

  describe file("#{Dir.home}/.anyenv/envs/rbenv/default-gems") do
    it { should be_file }
  end
end
