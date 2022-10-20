RSpec.describe "Run service", type: :request do
  describe "PUT|GET|POST|DELETE *path" do
    before do
      create(:request_setting, key: "url", value: "https://example.com/{method}")
      route = create(:route, service_path: "test1/:test1/test2/:test2", service_http_method: "post", remote_method: "test", request_http_method: "post")
      create(:params_remapping, route: route, initial_key: "test2", remapped_key: "test3", initial_value: "boom", remapped_value: "bang")

      stub_request(:post, "https://example.com/test")
        .with(body: {"test1" => "123", "test3" => "bang"})
        .to_return(status: 200, body: {status: :awesome}.to_json, headers: {})
    end

    it "send remapping params to remote server and return request" do
      post "/test1/123/test2/boom"

      expect(JSON.parse(response.body)).to eq({"status" => "awesome"})
    end
  end
end
