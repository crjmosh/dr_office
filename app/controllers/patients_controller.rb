class PatientsController < ApplicationController
  before_action :set_patient, except: [:index, :new, :create]

  def index
  	@patients = Patient.all
  end

  def show
  end

  def new
  	@patient = Patient.new
  end

  def create
  	@patient = Patient.new(patient_params)
  	if @patient.save
  		redirect_to @patient, notice: 'Patient created successfully.'
  	else
  		render :new, alert: @patient.errors.full_messages
  	end
  end

  def edit
  end

  def update
  	if @patient.update(patient_params)
  		redirect_to @patient, notice: 'Patient updated successfully.'
  	else
  		render :edit, alert: @patient.errors.full_messages
  	end
  end

  def destroy
  	@patient.destroy
  	redirect_to patients_path, notice: 'Patient deleted successfully.'
  end

  private

  def set_patient
  	@patient = Patient.find(params[:id])
  end

  def patient_params
  	params.require(:patient).permit(:name, :dob)
  end

end
