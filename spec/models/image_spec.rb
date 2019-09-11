require 'rails_helper'

RSpec.describe Image, type: :model do
  context "when initializing" do
    it 'requires name and user' do
      expect(Image.new).to be_invalid
    end

    it 'only requires name and user' do
      expect(Image.new(name: 'My First Image', user: User.new(name: 'Emanuele', email: 'emanuele@example.com'))).to be_valid
    end
  end
end
