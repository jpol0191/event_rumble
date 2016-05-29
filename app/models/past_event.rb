class PastEvent < ActiveRecord::Base
  belongs_to :user
  has_many :past_event_users, dependent: :destroy
end
