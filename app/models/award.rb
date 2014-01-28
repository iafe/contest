class Award < ActiveRecord::Base
  
  has_many :categories, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 100,  minimum: 1 }
  validates :description, presence: true, length: { maximum: 2000,  minimum: 1 }
  validates :rules, presence: true, length: { maximum: 2000,  minimum: 1 }
  validates :sponsor, length: { maximum: 100,  minimum: 1 }
  validates :sponsor_logo, length: { maximum: 300,  minimum: 1 }
  
  before_save { self.name = name.titleize }
  before_save { self.sponsor = sponsor.titleize }
end
