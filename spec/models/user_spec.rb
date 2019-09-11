# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context "when initializing" do
    it 'requires name and email' do
      expect(build(:user, :invalid)).to be_invalid
    end

    it 'only requires name and email' do
      expect(build(:user)).to be_valid
    end
  end
end
