class ScoreDetail < ActiveRecord::Base
  attr_accessor :points, :score_id, :score_item_id
  
  belongs_to :score, :score_item
  
  validates :points, presence: true, numericality: true, length: { maximum: 3,  minimum: 1 }
  validates :score_id, presence: true
  validates :score_item_id, presence: true
end
