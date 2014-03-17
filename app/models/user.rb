class User < ActiveRecord::Base
  
  has_many :submissions
  has_many :scores
  has_many :organizations, through: :user_organizations
  has_many :user_organizations, dependent: :restrict
  has_many :categories, through: :judges
  has_many :divisions, through: :judges
  has_many :judges, dependent: :restrict
  
  has_secure_password
  
  validates_confirmation_of :email
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name, presence: true, length: { maximum: 30,  minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 50,  minimum: 2 }
  validates :suffix, allow_blank: true, length: { maximum: 10,  minimum: 2 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false, 
    message: "already exists in our database under another user's record. Is this you? Please call the IAFE office." }, length: {maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20,  minimum: 9 }
  validates :password, length:  { maximum: 50,  minimum: 6 }, if: :password_changed?
  validates :email_confirmation, presence: true
  
  before_create :create_remember_token
  
  before_save { self.email = email.downcase }
  before_save { self.first_name = first_name.titleize }
  before_save { self.last_name = last_name.titleize }
  
  def first_last_email
    "#{last_name}, #{first_name} - #{email}"
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
	
    def password_changed?
      !self.password.blank?
    end

end
