class Division < ActiveRecord::Base
  
  has_many :submissions, dependent: :restrict_with_exception
  has_many :judges
  
  validates :name, presence: true, length: { maximum: 20,  minimum: 4 }
  validates :division_smallest, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :division_largest, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :description, presence: true, length: { maximum: 2000,  minimum: 10 }
  
  before_save { self.name = name.titleize }
end
