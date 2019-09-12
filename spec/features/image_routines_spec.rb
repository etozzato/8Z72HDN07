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

  it 'offers a form to upload an image' do
    sign_in
    visit new_image_path

    expect(page).to have_field('name')
    expect(page).to have_field('file')
  end

  feature 'Image upload' do
    it 'prevents an image to be uploaded without a name' do
      sign_in
      visit new_image_path
      fill_in 'name', with: nil
      attach_file 'file', Rails.root + 'spec/fixtures/image1.jpg'

      expect(page).to have_content 'You have 0 images'
      expect(page).to have_content 'Error: Missing image or image name!'
    end

    it 'uploads an image and updates the image count' do
      sign_in
      visit new_image_path

      expect(page).to have_content 'You have 0 images'
      
      fill_in 'name', with: 'Image 002'
      attach_file 'file', Rails.root + 'spec/fixtures/image2.jpg'

      expect(page).to have_content 'You have 1 images'
    end
  end
end
