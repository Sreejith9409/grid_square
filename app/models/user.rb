class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	validate :validate_email
	after_create :generate_username

	EMAIL_FORMAT = /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i

	def validate_email
		errors[:base] << "#{self.email} is not valid email"  if EMAIL_FORMAT.match(self.email.to_s.strip).nil?
	end

	def generate_username
		if self.user_name.blank?
			self.user_name = "#{self.name}-#{ SecureRandom.hex(1)}"
			self.save
		end
	end
end
