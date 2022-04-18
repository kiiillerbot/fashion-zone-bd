class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :contact
  validates_presence_of :address

  has_many :categories

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :locked
  end
end
