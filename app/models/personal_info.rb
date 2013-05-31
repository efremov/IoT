class PersonalInfo < ActiveRecord::Base
  attr_accessible :about, :age, :country, :name, :surname, :image
  belongs_to :user, foreign_key: :user_id 
  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},	 size: {less_than: 5.megabytes}
  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}
end
