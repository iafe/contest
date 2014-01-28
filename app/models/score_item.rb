class ScoreItem < ActiveRecord::Base
  attr_accessor :name, :description, :max_points, :category_id
  
  belongs_to :category
  
  belongs_to :score, through: :score_details
  
  validates :name, presence: true, length: { maximum: 80,  minimum: 3 }
  validates :description, presence: true, length: { maximum: 200,  minimum: 3 }
  validates :max_points, presence: true, numericality: true, length: { maximum: 3,  minimum: 1 }
  validates :category_id, presence: true
  
  before_save { self.name = name.titleize }
end
