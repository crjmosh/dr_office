require 'rails_helper'

RSpec.describe Appointment, type: :model do
  
	describe 'associations' do
		it { should belong_to :doctor }
		it { should belong_to :patient }
	end

	describe 'validations' do
		it { should validate_presence_of(:time) }
	end

end
