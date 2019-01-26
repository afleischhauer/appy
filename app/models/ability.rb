class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      can :manage, User, id: user.id
      if user.admin?
        can :manage, :all
      end
    end
  end
end
