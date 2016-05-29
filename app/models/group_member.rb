class GroupMember < ActiveRecord::Base
  belongs_to :group

  validates_presence_of :group_id
  validates_presence_of :friend_id
end
