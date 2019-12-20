require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :identification_no }
    it { is_expected.to have_db_column :vat_no }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :postcode }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :phone }    
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:company)).to be_valid
    end
  end
end