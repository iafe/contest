class OrganizationDetail < ActiveRecord::Base
  
  belongs_to :organization
  
  validates :fair_start_date, presence: true, length: { maximum: 20,  minimum: 4 }
  validates :fair_end_date, presence: true, length: { maximum: 20,  minimum: 4 }
  validates :total_attendance, presence: true, numericality: true, length: { maximum: 20,  minimum: 4 }
  validates :organization_id, presence: true
  
end
