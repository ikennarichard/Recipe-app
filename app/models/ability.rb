class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    return unless user.present?
    can :manage, :all
    can :manage, Recipe, user: user
    can :manage, Food, user: user
  end
end
