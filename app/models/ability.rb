class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe

    return unless user.present?
    can :manage, Recipe, user:
    can :manage, Food, user:
  end
end
