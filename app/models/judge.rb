class Judge < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :division
  
  validates :user_id, presence: true, uniqueness: {scope: :category_id, scope: :division_id }
  validates :category_id, presence: true
  validates :division_id, presence: true
end
