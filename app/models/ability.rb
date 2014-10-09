class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, :all
       elsif user.enabled?
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
           user.id == submission.user_id
         end
         can :create, SubmissionDetail
         can [:show, :update], SubmissionDetail, submission: {user_id: user.id}
         can [:delete, :destroy], SubmissionDetail
         can [:show, :edit, :update], Organization do |organization|
           UserOrganization.where(user_id: user.id, organization_id: organization.id).any? && organization.enabled?
         end
         can [:show, :edit, :update], UserOrganization do |user_organization|
           user.id == user_organization.user_id
         end
         can [:show, :edit, :update], OrganizationDetail do |organization_detail|
           UserOrganization.where(user_id: user.id, organization_id: organization_detail.organization.id).any?
         end
         if user.judge?
           can [:new, :create, :index, :show, :edit, :update], Score
         end
       else
         can [:show], Award do |contest|
           contest.enabled?
         end
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
