RSpec.describe MakeRequest do
  describe ".call" do
    before do
      create(:request_setting, key: "additional_request_params", value: "{\"add\": \"this\"}")
      create(:request_setting, key: "request_headers", value: "{\"Add\": \"this\"}")
      stub_request(:post, "https://example.com/").with(
        body: {"add" => "this", "question" => "ping?"},
        headers: {"Add" => "this"}
      ).to_return(status: 200, body: {answer: "pong!"}.to_json, headers: {})
    end

    it { expect(described_class.call(url: "https://example.com", request_method: "post", body: {question: "ping?"})).to eq({"answer" => "pong!"}) }
  end
end
