class Category < ActiveRecord::Base
  
  belongs_to :award
  
  has_many :submissions, dependent: :destroy
  has_many :score_items, dependent: :destroy
  has_many :users, through: :judges
  has_many :divisions, through: :judges
  
  validates :name, presence: true, length: { maximum: 100,  minimum: 1 }
  validates :code, presence: true, length: { maximum: 3,  minimum: 1 }
  validates :document_max_number, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :photo_max_number, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :video_max_number, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :max_total_file_size, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :description, presence: true, length: { maximum: 2000,  minimum: 1 }
  validates :rules, presence: true, length: { maximum: 5000,  minimum: 1 }
  validates :award_id, presence: true
  
  before_save { self.name = name.titleize }
end
