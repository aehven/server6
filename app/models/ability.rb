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
        can :access, :sub_customers

      when "supervisor"
        can [:index, :read, :create, :update], Customer do |customer|
          customer.id.nil? or
          user.customer.self_and_descendants.include? customer
        end

        can :destroy, Customer do |customer|
          user.customer.descendants.include?(customer)
        end

        can :manage, User do |u|
          u.customer.nil? or
          u.customer.self_and_ancestors.map(&:id).include? user.customer.id
        end

        can :access, :sub_customers

      when "manager"
        can :access, :sub_customers

        can :manage, User do |u|
          u.new_record? or user.can_access_customer? u.customer_id
        end

        can :manage, Customer do |customer|
          customer.new_record? or user.can_access_customer? customer.id
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
