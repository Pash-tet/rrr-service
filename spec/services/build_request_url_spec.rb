RSpec.describe BuildRequestUrl do
  describe ".call" do
    let(:method) { "test_method" }

    context "when request setting with key url exist" do
      before do
        create(:request_setting, key: "host", value: "example.com")
        create(:request_setting, key: "version", value: "0_5")
        create(:request_setting, key: "url", value: "https://{host}/{version}_{method}")
      end

      it { expect(described_class.call(method: method)).to eq("https://example.com/0_5_test_method") }
    end

    context "when request setting with key url not exist" do
      it { expect { described_class.call(method: method) }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
