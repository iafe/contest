class Score < ActiveRecord::Base
  attr_accessor :total_score, :comments, :disqualify, :user_id, :submission_id
  
  belongs to :user, :submission
  
  has_many :score_items, through: :score_details
  
  validates :total_score, presence: true, numericality: true, length: { maximum: 6,  minimum: 1 }
  validates :comments, length: { maximum: 500,  minimum: 1 }
  validates :user_id, presence: true
  validates :submission_id, presence: true
end
