class Patient < ApplicationRecord
	validates_presence_of :name

	has_many :appointments, dependent: :destroy
	has_many :doctors, through: :appointments
end
