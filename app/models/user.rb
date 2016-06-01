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
	has_many :friends, dependent: :destroy
	has_many :groups, dependent: :destroy
	has_many :past_events, dependent: :destroy
	has_many :power_ups, dependent: :destroy
	# ============================================

	#============= Facebook omniauth =============
	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider 	= auth.provider 
	    user.uid      	= auth.uid
	    user.email			= auth.info.email
	    user.fullname 	= auth.info.name
	    user.image			= auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      name = user.fullname.split(" ")
      user.fname 			= name[0]
      user.lname			= name[1]
      user.password 	= "password"
      user.password_confirmation	=	"password"
	    user.save
	  end
	end
	#=============================================	

end
