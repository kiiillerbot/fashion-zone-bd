class Category < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  default_scope {order(created_at: :desc)}

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_presence_of :description
end