class ScoreItem < ActiveRecord::Base
  
  belongs_to :category 
  
  validates :name, presence: true, length: { maximum: 80,  minimum: 3 }
  validates :description, length: { maximum: 200,  minimum: 3 }, allow_blank: true
  validates :max_points, presence: true, numericality: true, length: { maximum: 3,  minimum: 1 }
  validates :category_id, presence: true
  
  before_save { self.name = name.titleize }
end
