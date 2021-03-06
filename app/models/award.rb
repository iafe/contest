class Award < ActiveRecord::Base
  
  has_many :categories, dependent: :restrict_with_exception
  has_many :submissions, through: :categories
  
  validates :name, presence: true, length: { maximum: 100,  minimum: 1 }
  validates :description, presence: true, length: { maximum: 2000,  minimum: 1 }
  validates :rules, presence: true, length: { maximum: 20000,  minimum: 1 }
  validates :sponsor, length: { maximum: 100,  minimum: 1 }, allow_blank: true
  validates :sponsor_logo, length: { maximum: 300,  minimum: 1 }, allow_blank: true
  
end

