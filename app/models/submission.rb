class Submission < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :user
  belongs_to :organization
  belongs_to :division
  
  has_many :score_items, through: :score_details
  has_many :submission_details, dependent: :restrict
  has_many :scores, dependent: :restrict
  
  validates :contest_year, presence: true, numericality: true, length: { maximum: 4,  minimum: 4 }
  validates :notes, length: { maximum: 500,  minimum: 4 }, allow_blank: true
  validates :user_id, presence: true
  validates :organization_id, presence: true
  validates :category_id, presence: true, uniqueness: { scope: :contest_year, scope: :organization_id, 
    message: "already has a submission for this year. Please choose a different category."  }
  validates :division_id, presence: true
  validates :status, presence: true
  
  def calculate_final_score
    self.scores.average(:total_score)
  end
  
  def winner?
    winners = Submission.select('distinct(category_id), AVG(scores.total_score) as avg_score').joins(:scores)
    .group('submissions.id').order('AVG(scores.total_score) DESC')
    if (self.scores.average(:total_score) == winners[0].avg_score)
      return "First Place"
    elsif (self.scores.average(:total_score) == winners[1].avg_score)
      return "Second Place"
    elsif (self.scores.average(:total_score) == winners[2].avg_score)
      return "Third Place"
    else
      return ''
    end
  end

end
