# frozen_string_literal: true

module SessionHelpers
  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def sign_up_with(name, email, password)
    visit new_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def sign_in(trait=nil)
    user = build(:user, trait)

    sign_up_with(user.name, user.email, user.password)
    sign_out

    sign_in_with(user.email, user.password)

    user
  end

  def sign_out
    click_link 'Log out'
  end

  # def sign_in
  #   user = create(:user)
  #   visit sign_in_path
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign in'
  # end
end
