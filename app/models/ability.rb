class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.admin?
        can :manage, :all
    else

        # Product
        can :read, Product

        # Category
        can :read, Category

    end
  end
end