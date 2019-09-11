# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with invalid credentials' do
    sign_up_with '', '', '123'

    expect(page).to have_content('2 errors prohibited this user from being saved')
  end

  scenario 'with valid credentials' do
    sign_up_with 'Emanuele', 'valid@example.com', 'password'

    expect(page).to have_content('Hello, Emanuele Log out')
  end
end

feature 'Visitor signs in' do
  scenario 'with invalid credentials' do
    sign_in_with('wrong-email@example.com', '')

    expect(page).to have_content('Invalid Email or password')
  end
end
