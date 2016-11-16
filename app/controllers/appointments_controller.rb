class AppointmentsController < ApplicationController
  def new
    if Doctor.any? && Patient.any?
      @appointment = Appointment.new
      @doctors = Doctor.all.map { |d| [d.name, d.id] }
      @patients = Patient.all.map { |p| [p.name, p.id] }
    else
      redirect_to :back, alert: "There must be a doctor AND 
                                 a patient in the system before 
                                 an appointment can be made."
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to doctors_path, notice: "Appointment created successfully."
    else
      redirect_to new_appointment_path, alert: @appointment.errors.full_messages
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to :back
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :reason, :doctor_id, :patient_id)
  end
end