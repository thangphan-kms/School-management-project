# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  end_time   :datetime
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  subject_id :bigint           not null
#
# Indexes
#
#  index_schedules_on_course_id                 (course_id)
#  index_schedules_on_subject_id                (subject_id)
#  index_schedules_on_subject_id_and_course_id  (subject_id,course_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (subject_id => subjects.id)
#
class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :subject
end
