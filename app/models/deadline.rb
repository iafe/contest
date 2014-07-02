class Deadline < ActiveRecord::Base
  
  validates :deadline, presence: true
  validates :actual_deadline, presence: true
  
end
