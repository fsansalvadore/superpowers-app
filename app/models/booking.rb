class Booking < ApplicationRecord
  belongs_to :superpower
  belongs_to :rentee, class_name: 'User'
end
