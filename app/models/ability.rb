class Ability
  include CanCan::Ability

  #####
  # Explicitly stating all abilities (no 'manage') because that makes it much
  # easier on the client-side.  See client's user.ts.
  #####
  def initialize(user)
    case user.role
      when "CanaryAdmin"
        can :manage, :all
        can :access, :sub_organizations

      when "Admin"
        can [:read, :update], User, id: user.id
        cannot :index, User

      else
        can [:manage], Organization do |organization|
          organization.id.nil? or
          ((user.organization_forest.include? organization) and (user.organization.kind > organization.kind))
        end

        can :manage, User do |u|
          user == u or
          u.organization.nil? or 
          ((u.organization_forest.map(&:id) & user.organization_forest.map(&:id)).any? and (user.role > u.role))
        end

        can :access, :sub_organizations

    end

    # can :read, Notification do |notification|
    #   notification.users.include? user
    # end
    # can :update, NotificationsUser, user_id: user.id

    can :update, :profile
  end
end
