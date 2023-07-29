# == Schema Information
#
# Table name: courses_users
#
#  gpa       :float
#  course_id :bigint           not null
#  user_id   :bigint           not null
#
# Indexes
#
#  index_courses_users_on_course_id_and_user_id  (course_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
class CoursesUsers < ApplicationRecord
  belongs_to :class
  belongs_to :user
end
