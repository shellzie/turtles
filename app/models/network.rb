class Network < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 5, maximum: 255}
  validates :turtle_id, presence: true
  validates :password, presence: true
end
