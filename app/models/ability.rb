class Ability
  include CanCan::Ability

  def initialize(user)
    puts 'Ability init'
    puts "user: #{user}"

    if user.super_admin?
      can :read, Course
      can :destroy, Course, courses_users: { user_id: user.id }
    end
  end
end
