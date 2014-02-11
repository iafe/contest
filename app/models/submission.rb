class Submission < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :user
  belongs_to :organization
  belongs_to :division
  
  has_many :score_items, through: :score_details
  has_many :submission_details
  
  accepts_nested_attributes_for :submission_details
  
  validates :contest_year, presence: true, numericality: true, length: { maximum: 4,  minimum: 4 }
  validates :notes, length: { maximum: 500,  minimum: 4 }, allow_blank: true
  validates :user_id, presence: true
  validates :organization_id, presence: true
  validates :category_id, presence: true, uniqueness: { scope: :contest_year, scope: :organization_id  }
  validates :division_id, presence: true
  
end
