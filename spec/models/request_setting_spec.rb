RSpec.describe RequestSetting, type: :model do
  describe "validations" do
    it { should validate_presence_of(:key) }
    it { should validate_presence_of(:value) }

    context "when interpolated" do
      context "when needed records not exist" do
        it { expect { described_class.create!(key: "test", value: "{host}", interpolated: true) }.to raise_error(ActiveRecord::RecordInvalid) }
      end

      context "when needed records not exist" do
        before { create(:request_setting, key: "host", value: "https://example.com") }

        it { expect(described_class.create!(key: "test", value: "{host}", interpolated: true)).to be_truthy }
      end
    end
  end
end
