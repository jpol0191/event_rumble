class User < ActiveRecord::Base
	# =========== Password validations =========== 
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password
	# ============================================

	# ============ Email validations =============
	validates_presence_of :email
	validates_confirmation_of :email
	validates :email, uniqueness: true
	# ============================================
	
	# ============ Name validations ==============
	validates_presence_of :fname
	validates_presence_of :lname
	# ============================================

	# ============ Database relations ============ 
	has_many :friends
	has_many :groups
	has_many :past_events
	# ============================================

end
