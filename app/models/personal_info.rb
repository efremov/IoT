class PersonalInfo < ActiveRecord::Base
  attr_accessible :about, :age, :country, :name, :surname
  belongs_to :user, foreign_key: :user_id 
end
