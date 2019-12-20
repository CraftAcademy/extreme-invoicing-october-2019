require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Associations' do
    it { is_expected.to have_many :invoices }
    it { is_expected.to have_one :company }
    it { is_expected.to have_many :customers }
    it { is_expected.to have_many :articles }

  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:user)).to be_valid 
    end
  end
end