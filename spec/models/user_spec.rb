# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context "when initializing" do
    it 'requires name and email' do
      expect(User.new).to be_invalid
    end
    
    it 'only requires name and email' do
      expect(User.new(name: 'Emanuele', email: 'emanuele@example.com')).to be_valid
    end
  end
end
