class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
      can :manage, Dish::Difficulty
    else
    	can :read, Spree::Product
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)