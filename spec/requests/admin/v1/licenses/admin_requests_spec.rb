require 'rails_helper'

RSpec.describe "Admin V1 Licenses as :admin", type: :request do
  let(:user) { create(:user, profile: :admin) }

  context "GET /licenses" do
    let(:url) { "/admin/v1/licenses" }
    let(:game) { create(:game) }
    let!(:licenses) { create_list(:license, 5) }

    it "should return all Licenses" do
      get url, headers: auth_header(user)
      expect(body_json['licenses']).to contain_exactly *licenses.as_json(only: %i(
        id game_id:game.id user_id:user.id key
      ))
    end

    it "should return status 200 success" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end
end
