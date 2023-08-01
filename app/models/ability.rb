class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can(:read, Recipe, user:)

    return unless user.present?

    can :manage, :all
  end
end
