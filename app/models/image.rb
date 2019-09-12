# frozen_string_literal: true

class Image < ApplicationRecord
  validates_presence_of :name, :file, :user

  belongs_to :user, dependent: :destroy

  has_one_attached :file
end
