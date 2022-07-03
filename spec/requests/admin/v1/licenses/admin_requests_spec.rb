require 'rails_helper'

RSpec.describe "Admin V1 Licenses as :admin", type: :request do
  let(:user) { create(:user, profile: :admin) }

  context "GET /licenses" do
    let(:url) { "/admin/v1/licenses" }
    let(:game) { create(:game) }
    let!(:licenses) { create_list(:license, 10, game: game, user: user) }

    it "returns a list of licenses equals 10" do
      get url, headers: auth_header(user)
      expect(licenses.count).to eq(10)
    end

    it "should return status 200 success" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end

    it "should return status 401 unauthorized" do
      get url
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
