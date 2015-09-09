require 'spec_helper'

describe 'homebrew cask' do
  describe package('brew-cask') do
    it { should be_installed }
  end
end
