class ScoreDetail < ActiveRecord::Base
  
  belongs_to :score
  belongs_to :score_item
  
  validates :points, presence: true, numericality: true, length: { maximum: 3,  minimum: 1 }
  validates :score_id, presence: true
  validates :score_item_id, presence: true
end
