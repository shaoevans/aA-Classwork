
class User < ApplicationRecord
    attr_reader :password
    validates :user_name, :password_digest, :session_token, presence: true
    validates :session_token, :user_name, uniqueness: true
    before_validation :ensure_session_token

    has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


end
