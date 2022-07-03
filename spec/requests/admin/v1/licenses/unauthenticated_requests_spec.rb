require "rails_helper"

RSpec.describe "Admin::V1::Licenses without authentication", type: :request do
  let(:url) {  "/admin/v1/licenses" }
  let(:user) { create(:user, profile: :client) }
  let(:game) { create(:game) }
  let!(:licenses) { create_list(:license, 10, game: game, user: user) }

  context "GET /licenses" do
      before(:each) { get url }
    include_examples "unauthenticated access"
  end

  context "POST /licenses" do
    before(:each) { post url }
    include_examples "unauthenticated access"
  end

  context "PATCH /licenses" do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license, game: game, user: user) }

    before(:each) { patch url }
    include_examples "unauthenticated access"
  end
  context "DELETE /licenses" do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license, game: game, user: user) }

    before(:each) { delete url }
    include_examples "unauthenticated access"
  end
end
