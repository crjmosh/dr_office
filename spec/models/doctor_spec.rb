require 'rails_helper'

RSpec.describe Doctor, type: :model do

	describe 'associations' do
		it { should have_many :patients }
		it { should have_many :appointments }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
	end

end
