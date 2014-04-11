class Submission < ActiveRecord::Base
  
  scope :current_year_pending, -> {where(status: 'Pending', contest_year: Time.now.year)}
  scope :current_year_incomplete, -> {where(status: 'Incomplete', contest_year: Time.now.year)}
  scope :current_year_approved, -> {where(status: 'Approved', contest_year: Time.now.year)}
  scope :current_year_rejected, -> {where(status: 'Rejected', contest_year: Time.now.year)}
  scope :current_year_disqualified, -> {where(disqualify: true, contest_year: Time.now.year)}
  
  belongs_to :category
  belongs_to :user
  belongs_to :organization
  belongs_to :division
  
  has_many :submission_details, dependent: :restrict_with_exception
  has_many :scores, dependent: :restrict_with_exception
  
  validates :contest_year, presence: true, numericality: true, length: { maximum: 4,  minimum: 4 }
  validates :notes, length: { maximum: 500,  minimum: 4 }, allow_blank: true
  validates :user_id, presence: true
  validates :organization_id, presence: true
  validates :category_id, presence: true
  validates :division_id, presence: true
  validates :status, presence: true
  validates_uniqueness_of :category_id, scope: [:contest_year, :organization_id], unless: :multi_submit?, 
    message: "already has a submission for this year. Please choose a different category. Note: it is possible a different user within your organization already submitted an entry for this category, please check or call the IAFE office."
  
  def calculate_final_score
    self.scores.average(:total_score)
  end
  
  def winner?
    winners = Submission.select('distinct(category_id), AVG(scores.total_score) as avg_score').joins(:scores)
    .group('submissions.id').order('AVG(scores.total_score) DESC')
    if (self.scores.average(:total_score) == winners[0].avg_score)
      return "1st Place"
    elsif (self.scores.average(:total_score) == winners[1].avg_score)
      return "2nd Place"
    elsif (self.scores.average(:total_score) == winners[2].avg_score)
      return "3rd Place"
    else
      return ''
    end
  end
  
  #def winner?
    #Submission.select('category_id, contest_year, division_id, AVG(scores.total_score) as calculate_final_score, 
    #dense_rank() over (partition by calculate_final_score) as rank').joins(:scores)
  #end
  
  private
    def multi_submit?
      if self.category.accepts_multiple_submissions == true
        return true
      else
        return false
      end
    end

end
