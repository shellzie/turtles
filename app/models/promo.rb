class Promo < ActiveRecord::Base

  validates :code, presence: true, length: {minimum: 4}
  validates :description, length: {maximum: 255}

end