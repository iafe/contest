class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_many :submissions
  has_many :scores
  has_many :organizations, through: :user_organizations
  has_many :user_organizations, dependent: :restrict
  has_many :categories, through: :judges
  has_many :divisions, through: :judges
  has_many :judges, dependent: :restrict
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name, presence: true, length: { maximum: 30,  minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 50,  minimum: 2 }
  validates :suffix, allow_blank: true, length: { maximum: 10,  minimum: 2 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false, 
    message: "already exists in our database under another user's record. Is this you? Please call the IAFE office." }, length: {maximum: 50 }
  validates :email_confirmation, presence: true, if: :new_record?
  validates :email_confirmation, presence: true, if: :email_changed?
  validates_confirmation_of :email, if: :new_record?
  validates_confirmation_of :email, if: :email_changed?
  validates :phone, presence: true, length: { maximum: 20,  minimum: 9 }
  
  before_save { self.email = email.downcase }
  before_save { self.first_name = first_name.titleize }
  before_save { self.last_name = last_name.titleize }
  
  def first_last_email
    "#{last_name}, #{first_name} - #{email}"
  end

end
