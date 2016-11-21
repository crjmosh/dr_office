require 'rails_helper'

RSpec.describe Patient, type: :model do

	describe 'associations' do
		it { should have_many :appointments }
		it { should have_many :doctors }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
	end

end