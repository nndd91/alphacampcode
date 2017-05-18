class StudentsController < ApplicationController

  def index
    @students = Student.all.group_by(&:gender)
  end
  
  def show
    @student = Student.find(params[:id])
  end

  def delete
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  

end