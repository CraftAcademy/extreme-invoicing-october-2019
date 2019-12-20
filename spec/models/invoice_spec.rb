# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :date }
    it { is_expected.to have_db_column :due_date }
    it { is_expected.to have_db_column :subtotal }
    it { is_expected.to have_db_column :tax }
    it { is_expected.to have_db_column :total }
    it { is_expected.to have_db_column :paid_for }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :invoice_rows }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:invoice)).to be_valid
    end
  end
end
