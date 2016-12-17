class Turtle < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 },
             uniqueness: { case_sensitive: false, scope: :user_id, message: "A turtle exists with the same name" }
  validates :image_path, presence: false
  validates :birthdate, presence: false


  validates :bio, presence: false, length: {maximum: 200}
  validates :hobbies, presence: false, length: {maximum: 100}
  validates :color, presence: false, length: {maximum: 100}
  validates :dance, presence: false, length: {maximum: 100}
  validates :music, presence: false, length: {maximum: 100}
  validates :phrase, presence: false, length: {maximum: 100}

end
