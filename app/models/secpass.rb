class Secpass < ApplicationRecord
	has_secure_password
	validates :name, uniqueness: true
	# validates :macname, uniqueness: true
	# validates :tell, uniqueness: true
    
    def self.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def self.encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
    end
end
