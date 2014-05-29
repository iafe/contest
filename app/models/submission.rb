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
  
  def ranking
    sql_query = %Q{SELECT 
   *, dense_rank() OVER (
       PARTITION BY contest_year, category_id, division_id
       ORDER BY final_score DESC
   )
FROM (
    SELECT 
        Submissions.id, 
        Submission.contest_year AS contest_year, 
        Submission.category_id AS category_id, 
        Submission.division_id AS division_id, 
        AVG(Scores.total_score) AS final_score
    FROM Submissions 
        INNER JOIN Scores ON (Submissions.id = Scores.submission_id)
    GROUP BY 
        Submissions.id, 
        Submission.contest_year, 
        Submission.category_id, 
        Submission.division_id
) AS FinalScores}

submissions_by_rank = Submission.find_by_sql(sql_query)
  end
  
  private
    def multi_submit?
      if self.category.accepts_multiple_submissions == true
        return true
      else
        return false
      end
    end

end
