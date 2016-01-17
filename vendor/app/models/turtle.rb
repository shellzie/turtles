class Turtle < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 },
             uniqueness: { case_sensitive: false, scope: :user_id, message: "A turtle exists with the same name" }

  validates :bio, presence: false, length: { maximum: 100}

  validates :image_path, presence: false

end
