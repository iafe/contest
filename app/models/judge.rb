class Judge < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :division
  
  # Make sure a judge cannot be assigned to the same category + division twice.
  validates :user_id, presence: true, uniqueness: {scope: [:category_id, :division_id], message: "has already been assigned to this 
    category and division." }
  validates :category_id, presence: true
  validates :division_id, presence: true
end
