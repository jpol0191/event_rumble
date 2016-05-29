class Group < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :name
  
  belongs_to :user
  has_many :group_members, dependent: :destroy
end
