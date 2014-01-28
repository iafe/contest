class Judge < ActiveRecord::Base
  attr_accessor :user_id, :category_id, :division_id

  belongs_to :user, :category, :division
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :division_id, presence: true
end
