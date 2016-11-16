class Doctor < ApplicationRecord
	validates_presence_of :name

	has_many :appointments, dependent: :destroy
	has_many :patients, through: :appointments
end
