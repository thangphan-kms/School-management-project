# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  role_id    :bigint           not null
#
# Indexes
#
#  index_users_on_course_id  (course_id)
#  index_users_on_role_id    (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (role_id => roles.id)
#
class User < ApplicationRecord
  belongs_to :role
  has_many :courses
end

# Students have many courses
# student1 = User.where(role_id: 2)
# student1.classes
