class Api::V1::CoursesController < ActionController::API
  load_and_authorize_resource

  def index
    @courses = Course.all
    render json: { courses: @courses }
  end

  def show
    course_id = params[:id]
    @course = Course.find(course_id)
    render json: { course: @course }
  end
end
