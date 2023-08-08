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

  def update
  end
end
