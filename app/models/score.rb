class Score < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :submission
  
  validates :total_score, presence: true, numericality: {greater_than_or_equal_to: 0}, length: { maximum: 6,  minimum: 1 }
  validate :above_max_points?
  validates :comments, length: { maximum: 500,  minimum: 1 }, allow_blank: true
  validates :user_id, presence: true
  validates :submission_id, presence: true, uniqueness: {scope: :user_id}
  
  private
    def above_max_points? # In case a judge enters in more points than the maximum allowed.
      if total_score > submission.category.score_items.sum(:max_points)
        errors.add :base, ("You have inputted a higher total score than the maximum allowed.")
      end
    end

end
