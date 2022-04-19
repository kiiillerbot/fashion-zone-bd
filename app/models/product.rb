class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope {order(created_at: :desc)}

  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :description
end
