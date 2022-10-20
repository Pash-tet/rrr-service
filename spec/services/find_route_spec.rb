RSpec.describe FindRoute do
  describe ".call" do
    let(:request_path) { "test/hot/test1/chicks777/test3/motors" }
    let(:request_method) { "put" }

    before { create(:route, service_path: "test/:test1/test1/:test2/test3/:test3", service_http_method: "put") }

    it { expect(described_class.call(path: request_path, request_method: request_method)).to eq(Route.first) }
  end
end
