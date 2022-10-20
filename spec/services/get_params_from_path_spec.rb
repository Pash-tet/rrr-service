RSpec.describe GetParamsFromPath do
  describe ".call" do
    let(:route) { create(:route, service_path: "test/:test1/test1/:test2/test3/:test3", service_http_method: "put") }
    let(:request_path) { "test/hot/test1/chicks777/test3/motors" }
    let(:expected_result) { {"test1" => "hot", "test2" => "chicks777", "test3" => "motors"} }

    it { expect(described_class.call(route: route, path: request_path)).to eq(expected_result) }
  end
end
