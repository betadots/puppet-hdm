# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'hdm' do
  context 'with docker' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        class { 'hdm':
          method => 'docker',
        }
        PUPPET
      end
    end
    describe service('docker-hdm') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
