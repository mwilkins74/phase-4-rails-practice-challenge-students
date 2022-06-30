class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students
    end

    def show
        student = find_student
        render json: student
    end

    def create
        Student.create(student_params)
        render json: student, include: :instructor
    end

    def destroy
        student = find_student
        student.destroy
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age)
    end
end
