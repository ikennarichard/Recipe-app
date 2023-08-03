class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe

    return unless user.present?

    can :manage, :all
    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
