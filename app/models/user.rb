# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_many :images, dependent: :destroy
end
