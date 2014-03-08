class Score < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :submission
  
  has_many :score_items, through: :score_details
  has_many :score_details
  
  validates :total_score, presence: true, numericality: {greater_than_or_equal_to: 0}, length: { maximum: 6,  minimum: 1 }
  validate :above_max_points?
  validates :comments, length: { maximum: 500,  minimum: 1 }, allow_blank: true
  validates :user_id, presence: true
  validates :submission_id, presence: true
  
  private
    def above_max_points?
      if total_score > submission.category.score_items.map(&:max_points).sum
        errors.add :base, ("You have inputted a higher total score than the maximum allowed.")
      end
    end

end
