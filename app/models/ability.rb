# This file limits the ability of users from accessing pages they do not have the authority to access.
# It is supported through the CanCan gem.

class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, :all
       elsif user.enabled? # Disabling a user means the person cannot create new submissions/attachements, new orgs, or link themselves to orgs
         can [:new, :create, :index], Submission
         can [:new, :create], Organization
         can [:new, :create, :destroy, :delete], UserOrganization
         can [:new, :create], OrganizationDetail
         can [:show], Award do |contest|
           contest.enabled?
         end
         can [:show, :edit, :update], User do |current_user|
           user.id == current_user.id && user.enabled?
         end
         can [:show, :edit, :update, :destroy, :delete], Submission do |submission|
           user.id == submission.user_id # A user can only see/update submissions that belong to them
         end
         can :create, SubmissionDetail
         can [:show, :update], SubmissionDetail, submission: {user_id: user.id} # A user can only see/update attachments that belong to them
         can [:delete, :destroy], SubmissionDetail
         can [:show, :edit, :update], Organization do |organization|
           UserOrganization.where(user_id: user.id, organization_id: organization.id).any? && organization.enabled?
         end
         can [:show, :edit, :update], UserOrganization do |user_organization|
           user.id == user_organization.user_id # A user can only edit or delete a relationship to an org if it is the user's relationship
         end
         can [:show, :edit, :update], OrganizationDetail do |organization_detail|
           UserOrganization.where(user_id: user.id, organization_id: organization_detail.organization.id).any?
           # A user can only edit a fair's dates/attendance if the user has a relationship to that fair
         end
         if user.judge? # Only users with the "Judge?" option checked in their profile can view and score entries
           can [:new, :create, :index, :show, :edit, :update], Score
         end
       else
         can [:show], Award do |contest|
           contest.enabled?
         end
       end
  end
end
