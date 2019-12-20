require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :unit }
    it { is_expected.to have_db_column :unit_price }
    it { is_expected.to have_db_column :taxrate }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :unit }
    it { is_expected.to validate_presence_of :unit_price }
    it { is_expected.to validate_presence_of :taxrate }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end
end
