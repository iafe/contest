class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :submissions
  has_many :submission_details, through: :submissions
  has_many :scores
  has_many :organizations, through: :user_organizations
  has_many :user_organizations, dependent: :restrict_with_exception
  has_many :categories, through: :judges
  has_many :divisions, through: :judges
  has_many :judges, dependent: :restrict_with_exception
  


end
