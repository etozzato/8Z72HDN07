# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with invalid credentials' do
    u = build(:user, :invalid)
    sign_up_with(u.name, u.email, u.password)

    expect(page).to have_content '2 errors prohibited this user from being saved'
  end

  scenario 'with valid credentials' do
    u = build(:user)
    sign_up_with(u.name, u.email, u.password)

    expect(page).to have_content "Hello, #{u.name} Log out"
  end
end

feature 'Visitor signs in' do
  scenario 'non existing user' do
    u = build(:user)
    sign_in_with(u.email, u.password)

    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'existing user' do
    u = build(:user)

    sign_up_with(u.name, u.email, u.password)
    sign_out

    sign_in_with(u.email, u.password)

    expect(page).to have_content "Hello, #{u.name} Log out"
  end
end
