require 'spec_helper'

describe 'vcs' do
  %w(
    git
    tig
    gibo

    hub
    gist
    ghr

    bazaar
    mercurial
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
