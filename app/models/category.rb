class Category < ApplicationRecord
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_presence_of :description
end