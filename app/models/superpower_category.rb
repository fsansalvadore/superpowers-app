class SuperpowerCategory < ApplicationRecord
  has_many :superpowers

  validates :name, presence: true
  validates :name, uniqueness: true
  def get_sound
    if name == "Speedy fingers"
      return "typing.mp3"
    elsif name == "Immortality"
      return "immortality.mp3"
    elsif name == "Mind control"
      return "mind-control.mp3"
    elsif name == "Super IQ"
      return "high-iq.mp3"
    elsif name == "Time travel"
      return "time-travel.mp3"
    elsif name == "Teleportation"
      return "time-travel.mp3"
    elsif name == "Manipulate time"
      return "manipulate-time.mp3"
    elsif name == "Perception"
      return "perception.mp3"
    elsif name == "X-ray vision"
      return "x-ray-vision.mp3"
    elsif name == "Speed"
      return "speed.mp3"
    else
      return "immortality.mp3"
    end
  end
end
