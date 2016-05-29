class PowerUp < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :user_id
	validates_presence_of :desc
	
  belongs_to :user
end
