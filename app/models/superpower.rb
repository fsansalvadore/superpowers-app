class Superpower < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :superpower_category
  has_many :bookings

  # To be completed with a through relationship
  # has_many :users, through: :bookings, :foreign_key => 'rentee_id', :class_name => 'User'
  # has_many :users, :through => :bookings, :source => 'rentee'
end
