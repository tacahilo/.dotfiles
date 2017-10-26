require 'spec_helper'

describe 'gnu packages' do
  %w(
    autoconf
    automake
    gzip
    coreutils
    parallel
    gnupg
    gnu-sed
    gnu-tar
    grep
    pinentry-mac
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
