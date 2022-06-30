class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors 
    end

    def show
        instructor = find_instructor
        render json: instructor
    end

    def create 
        instructor.create(name: params[:name])
        render json: instructor, status: :created
    end

    def destroy
        instructor = find_instructor
        instructor.destroy
    end

    private

    def find_instructor
        Instructor.find(params[:instructor_id])
    end
end
