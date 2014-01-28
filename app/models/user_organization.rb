class UserOrganization < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :organization
  
  validates :user_id, presence: true
  validates :organization_id, presence: true, uniqueness: {scope: :user_id}
  
  validates :primary, uniqueness: {scope: :user_id}, unless: :primary_uniqueness?
  
  def primary_uniqueness?
     if primary == true
        return false
    else 
        return true
    end
  end
  
end
