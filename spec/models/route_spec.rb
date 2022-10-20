RSpec.describe Route, type: :model do
  describe "associations" do
    it { should have_many(:params_remappings) }
  end

  describe "validations" do
    subject { build(:route) }

    it { should validate_presence_of(:service_path) }
    it { should validate_presence_of(:service_http_method) }
    it { should validate_presence_of(:request_http_method) }
    it { should validate_presence_of(:remote_method) }
    it { should validate_uniqueness_of(:service_path).scoped_to(:service_http_method) }
  end

  describe ".active" do
    context "when without disabled flag" do
      it "includes" do
        create(:route, disabled: false)

        expect(described_class.active.count).to eq(1)
      end
    end

    context "when with disabled flag" do
      it "includes" do
        create(:route, disabled: true)

        expect(described_class.active.count).to be_zero
      end
    end
  end
end
