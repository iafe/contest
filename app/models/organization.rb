class Organization < ActiveRecord::Base
  
  has_many :submissions
  has_many :users, through: :user_organizations
  has_many :user_organizations, dependent: :destroy
  has_many :organization_details, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 80,  minimum: 3 }, uniqueness: { scope: :state_province }
  validates :primary_contact, presence: true, length: { maximum: 80,  minimum: 5 }
  validates :address_line_1, presence: true, length: { maximum: 50,  minimum: 5 }
  validates :address_line_2, length: { maximum: 50, minimum: 5 }, allow_blank: true
  validates :city, presence: true, length: { maximum: 50, minimum: 2 }
  validates :state_province, presence: true, length: { maximum: 3, minimum: 2 }
  validates :country, presence: true, length: { maximum: 50, minimum: 2 }
  validates :zip_code, presence: true, length: { maximum: 10, minimum: 5 }
  validates :phone, presence: true, length: { maximum: 20,  minimum: 9 }
  
  before_save { self.name = name.titleize }
  before_save { self.primary_contact = primary_contact.titleize }
  before_save { self.address_line_1 = address_line_1.titleize }
  before_save { self.address_line_2 = address_line_2.titleize }
  before_save { self.city = city.titleize }
  before_save { self.state_province = state_province.upcase }
  before_save { self.country = country.titleize }
  
  def name_and_state
    "#{name}, #{state_province}"
  end
  
  def which_division
    last_details = organization_details.order('created_at DESC').first
    if (last_details.present?) && (last_details.created_at.year == Time.now.year)
      Division.where(':total_attendance >= division_smallest AND :total_attendance <= division_largest', 
      total_attendance: last_details.total_attendance).first.name
    else
      "Total attendance not yet inputted for the contest year. <a href='/organization_details/new'>Update the record now.</a>"
    end
  end
  
  def submission_division
    last_details = organization_details.order('created_at DESC').first
    if (last_details.present?) && (last_details.created_at.year == Time.now.year)
      Division.where(':total_attendance >= division_smallest AND :total_attendance <= division_largest', 
      total_attendance: last_details.total_attendance).first.id
    else
      ''
    end
  end

end
