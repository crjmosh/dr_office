class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:index, :new, :create]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: "Doctor created successfully."
    else
      render :new, alert: @doctor.errors.full_messages
    end
  end

  def edit

  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: "Doctor updated successfully."
    else
      render :edit, alert: @doctor.errors.full_messages
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path, notice: "Doctor deleted successfully."
  end

  private
  
  def doctor_params
    params.require(:doctor).permit(:name, :specialty)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end