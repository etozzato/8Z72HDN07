# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_images, only: %i[index new]

  def create
    Image.create(
      name: image_params[:name],
      file: image_params[:file],
      user: current_user
    )

    head :no_content
  end

  protected

    def image_params
      params.permit(:file, :name, :authenticity_token)
    end

    def load_images
      @images = current_user.images
    end
end
