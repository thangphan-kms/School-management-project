course1 = Course.create(name: 'History class')
course2 = Course.create(name: 'Math class')
course3 = Course.create(name: 'Physical class')
couiiirse4 = Course.create(name: 'Medical class')
course5 = Course.create(name: 'Swimming class')

User.create!(
  name: 'John Doe',
  email: 'john@example.com',
  password: 'Password1',
  role: 'super_admin'
)

User.create!(
  name: 'Jane Smith',
  email: 'jane@example.com',
  password: 'Password1',
  role: 'student'
)

# teacher1 = User.create(name: 'Suong', role_id: role3.id)
# teacher2 = User.create(name: 'Thao', role_id: role3.id)
# teacher3 = User.create(name: 'Cuong', role_id: role3.id)

# student1 = User.create(name: 'Thang', role_id: role2.id)
# student2 = User.create(name: 'Ngoc', role_id: role2.id)
# student3 = User.create(name: 'Bioch', role_id: role2.id)

# Student have courses
course_student1 = CoursesUser.create(course_id: course1.id, user_id: 1)
course_student2 = CoursesUser.create(course_id: course2.id, user_id: 1)
course_student3 = CoursesUser.create(course_id: course3.id, user_id: 1)

# admin1 = User.create(name: 'Nguyen', role_id: role1.id)
