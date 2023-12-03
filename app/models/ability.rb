# frozen_string_literal: true

class Ability
  include CanCan::Ability

 def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :destroy, Comment do |comment|
        comment.user == user
      end

      can :update, Comment do |comment|
        comment.user == user
      end

      can :create, Comment
    end
  end

end
