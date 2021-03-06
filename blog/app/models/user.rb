class User < ApplicationRecord
    has_many :articles
    has_many :comments
    has_many :favorite_articles
    has_many :favorites, through: :favorite_articles, source: :article
    
    # VALID_EMAIL_REGEX = /A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    
    validates :name,
        presence: true,
        length: { maximum: 12 },
        uniqueness: { case_sensitive: false }

    
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
        
    validates :password,
        presence: true,
        length: { minimum: 6 }
        
    has_secure_password
end
