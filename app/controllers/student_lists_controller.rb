class StudentListsController < ApplicationController
  def new
    @student_list = StudentList.new
  end

  def create
    @student_list = StudentList.new(student_list_params)
    @student_list.user = current_user
    @student_list.banner = "https://images.unsplash.com/photo-1581078426770-6d336e5de7bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
    if @student_list.save
      redirect_to student_lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @student_lists = StudentList.where(user: current_user)
  end

  def show
    @student_list = StudentList.find(params[:id])
    @student = Student.new
  end

  def edit
    @student_list = StudentList.find(params[:id])
  end

  def update
    @student_list = StudentList.find(params[:id])
    if @student_list.update(student_list_params)
      redirect_to student_lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student_list = StudentList.find(params[:id])
    @student_list.destroy
    redirect_to student_lists_path, status: :see_other
  end

  def student_list_params
    params.require(:student_list).permit(:list_name, :description, :banner)
  end
end
