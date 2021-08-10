# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { build(:user).extend UserDecorator }
  subject { user }
  it { should be_a User }

  context '#name_addr' do
    subject { user.name_addr }
    it { is_expected.to match /.+<.+>/ }
    it { is_expected.to start_with user.name }
    it { is_expected.to include user.email }
  end
end
