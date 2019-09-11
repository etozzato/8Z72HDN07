# frozen_string_literal: true

class Image < ApplicationRecord
  validates_presence_of :name, :user

  belongs_to :user, dependent: :destroy
end
