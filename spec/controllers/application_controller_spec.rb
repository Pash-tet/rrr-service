RSpec.describe ApplicationController, type: :controller do
  describe "GET /ping" do
    it "sends pong" do
      get :ping

      aggregate_failures do
        expect(response).to have_http_status(:success)
        expect(response.body).to eq("pong!")
      end
    end
  end
end
