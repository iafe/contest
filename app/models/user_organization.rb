class UserOrganization < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :organization
  
  validates :user_id, presence: true
  validates :organization_id, presence: true, uniqueness: {scope: :user_id, message: "is already tied to your user account."}
  
  validates :primary, uniqueness: {scope: :user_id, message: "label already exists with another organization you have tied to your
    record, please uncheck the checkbox below or edit your other organization first to remove it as your primary organization, or call the IAFE office."}, unless: :primary_uniqueness?
  
  def primary_uniqueness?
     if primary == true
        return false
    else 
        return true
    end
  end
  
end
