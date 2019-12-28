
RSpec.describe InvoiceRow, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :invoice_id }
    it { is_expected.to have_db_column :article_id }
    it { is_expected.to have_db_column :quantity }

  end
  describe 'Associations' do
    it { is_expected.to belong_to :invoice }
    it { is_expected.to belong_to :article }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:invoice_row)).to be_valid
    end
  end
end
