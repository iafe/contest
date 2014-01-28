class Submission < ActiveRecord::Base
  attr_accessor :contest_year, :notes, :approved, :physical_version_received, :digital_version_received, :disqualify, :category_id, :user_id, :organization_id, :division_id
  
  belongs_to :category, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :organization, dependent: :destroy
  belongs_to :division, dependent: :destroy
  
  has_many :score_items, through: :score_details
  
  validates :contest_year, presence: true, numericality: true, length: { maximum: 4,  minimum: 4 }
  validates :notes, length: { maximum: 500,  minimum: 4 }
  validates :user_id, presence: true
  validates :organization_id, presence: true, uniqueness: { scope: :contest_year, scope: :category_id  }
  validates :category_id, presence: true
  validates :division_id, presence: true
end
