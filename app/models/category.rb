class Category < ActiveRecord::Base
  
  belongs_to :award
  
  has_many :submissions
  has_many :score_items, dependent: :restrict_with_exception
  
  validates :name, presence: true, length: { maximum: 200,  minimum: 1 }
  validates :code, presence: true, length: { maximum: 3,  minimum: 1 }
  validates :code, presence: true, length: { maximum: 3,  minimum: 1 }
  validates :submission_file_type, presence: true
  validates :document_max_number, presence: true, numericality: true, length: {maximum: 20, minimum: 1 }
  validates :max_total_file_size, presence: true, numericality: true, length: { maximum: 20,  minimum: 1 }
  validates :description, presence: true, length: { maximum: 2000,  minimum: 1 }
  validates :rules, presence: true, length: { maximum: 5000,  minimum: 1 }
  validates :award_id, presence: true
  
  before_save { self.name = name.titleize }
  
  def award_code_category
    "#{award.name} #{code}: #{name}"
  end
  
  def self.sort_by_category_codes(categories)
    sorted_categories = categories.sort do |cat1, cat2|
    if cat1.award.name == cat2.award.name
      # award name matches so compare by code
      if cat1.code.to_i == cat2.code.to_i
        # the leading numbers are the same (or no leading numbers)
        # so compare alphabetically
        cat1.code <=> cat2.code
      else
        # there was a leading number so sort numerically
        cat1.code.to_i <=> cat2.code.to_i
      end
    else
      # award names were different so compare by them
      cat1.award.name <=> cat2.award.name
    end
  end
  
  return sorted_categories
  end

end
