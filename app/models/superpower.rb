class Superpower < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :superpower_category
  has_many :bookings

  validates :name, :description, :image, :price, presence: true
  validates :name, uniqueness: true

  validates_numericality_of :price, :greater_than => 0.0

  mount_uploader :image, PhotoUploader
  # mount_uploader :tumbnail, PhotoUploader

  # To be completed with a through relationship
  # has_many :users, through: :bookings, :foreign_key => 'rentee_id', :class_name => 'User'
  # has_many :users, :through => :bookings, :source => 'rentee'
end
