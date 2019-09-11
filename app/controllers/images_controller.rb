# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_images, only: %i[index new]

  def create
    byebug
  end

  protected

    def load_images
      @images = current_user.images
    end
end
