# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Post
    can :read, Comment

    return unless user.present?

    can :manage, Post, author: user
    can :manage, Comment, author: user
    can :create, Comment
    can :create, Like
    return unless user.role == 'admin'

    can :manage, :all
  end
end
