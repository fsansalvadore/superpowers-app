class Superpower < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :superpower_category
  has_many :bookings, dependent: :destroy

  validates :name, :description, :image, :price, presence: true
  validates :name, uniqueness: true

  validates_numericality_of :price, :greater_than => 0.0

  mount_uploader :image, PhotoUploader

  # def self.search(search)
  #   if search

  #     sql_query = " \
  #       superpower.name ILIKE :search \
  #       OR superpower.description ILIKE :search \
  #       OR superpower.superpower_category.name ILIKE :search \
  #     "
  #     superpower = Superpower.joins(:superpower_categories).where(sql_query, query: "%#{search}%")

  #   if superpower
  #     superpower

  #     else
  #       Superpower.all
  #     end
  #   else
  #     Superpower.all
  #   end
  # end


  # mount_uploader :tumbnail, PhotoUploader

  # To be completed with a through relationship
  # has_many :users, through: :bookings, :foreign_key => 'rentee_id', :class_name => 'User'
  # has_many :users, :through => :bookings, :source => 'rentee'
  def get_sound_path
    superpower_category.get_sound
  end
end
