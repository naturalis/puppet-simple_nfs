require 'spec_helper'
describe 'simple_nfs' do
  context 'with default values for all parameters' do
    it { should contain_class('simple_nfs') }
  end
end
