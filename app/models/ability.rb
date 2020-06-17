class Ability
  include CanCan::Ability

  #####
  # Explicitly stating all abilities (no 'manage') because that makes it much
  # easier on the client-side.  See client's user.ts.
  #####
  def initialize(user)
    case user.role
      when "admin"
        can :manage, :all
        can :access, :sub_organizations

      when "supervisor"
        can [:index, :read, :create, :update], Organization do |organization|
          organization.id.nil? or
          user.organization.self_and_descendants.include? organization
        end

        can :destroy, Organization do |organization|
          user.organization.descendants.include?(organization)
        end

        can :manage, User do |u|
          u.organization.nil? or
          u.organization.self_and_ancestors.map(&:id).include? user.organization.id
        end

        can :access, :sub_organizations

      when "manager"
        can :access, :sub_organizations

        can :manage, User do |u|
          u.new_record? or user.can_access_organization? u.organization_id
        end

        can :manage, Organization do |organization|
          organization.new_record? or user.can_access_organization? organization.id
        end

      when "regular"
        can [:read, :update], User, id: user.id
        cannot :index, User
    end

    # can :read, Notification do |notification|
    #   notification.users.include? user
    # end
    # can :update, NotificationsUser, user_id: user.id

    can :update, :profile
  end
end
