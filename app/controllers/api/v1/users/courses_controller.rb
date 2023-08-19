class Api::V1::Users::CoursesController < Common::AuthController
  load_and_authorize_resource

  def index
    puts "current_user: #{current_user}"
    user = User.find(current_user.id)
    @courses = user.courses
    puts "courses: #{@courses}"
    render json: { courses: @courses }
  end

  def show
  end

  def destroy
    course_id = params[:id]
    user_id = current_user.id
    @user = User.find(user_id)

    @course = Course.find(course_id)
    puts "course will be delete: #{@course}"

    # Auto delete join table
    @user.courses.delete(@course)

    render json: { message: 'Deleted course' }
  end

  def update
  end
end
