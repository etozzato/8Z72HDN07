# frozen_string_literal: true

require 'rails_helper'

feature 'User access to the image functionality' do
  it 'is not allowed when unauthenticated' do
    visit images_path

    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it 'is allowed when authenticated' do
    u = sign_in
    visit images_path

    expect(page).to have_content "Hello, #{u.name} Log out"
  end
end

feature 'Image functionality', js: true do

  it 'displays the initial count of images for the user' do
    sign_in
    visit images_path

    expect(page).to have_content 'You have 0 images'
  end

  it 'displays the correct count of images for the user with images' do
    u = sign_in(:with_images)
    visit images_path

    expect(page).to have_content "You have #{u.images.count} images"
  end

  it 'offers a link to an image upload form' do
    sign_in
    visit images_path

    expect(page).to have_content 'upload an image'
  end

end
