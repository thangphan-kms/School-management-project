# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    puts 'Ability init'
    puts "user: #{user}"

    return unless user.super_admin?
    can :read, :all

    # can :read, Course, published: true

    # # Return if not user
    # return unless user.present?

    # can :read, Course, user: user
    # can :update, Course, user: user

    # # Return if not admin
    # # Admin can update all course data model?
    # return unless user.admin?

    # can :read, Course
    # can :update, Course
  end
end
